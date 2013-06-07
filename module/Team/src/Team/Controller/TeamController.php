<?php

namespace Team\Controller;

use Zend\Mvc\Controller\AbstractActionController,
    Zend\View\Model\ViewModel, 
    Team\Form\TeamForm,
    Doctrine\ORM\EntityManager,
    Team\Entity\Team,
    Team\Entity\Player,
    Team\Entity\Rooster
;

class TeamController extends AbstractActionController
{
    /**
     * @var Doctrine\ORM\EntityManager
     */
    protected $em;

    public function findAll($entity)
    {
        return $this->getEntityManager()->getRepository(str_replace('\Controller', '', __NAMESPACE__) . "\\Entity\\" . $entity)->findAll();
    }

    public function findOne($entity, $id)
    {
        return $this->getEntityManager()->getRepository(str_replace('\Controller', '', __NAMESPACE__) . "\\Entity\\" . $entity)->findOneById($id);
    }
    
    public function setEntityManager(EntityManager $em)
    {
        $this->em = $em;
    }
    
    public function curlFetch($url, array $options = array())
    {

//        $cookie = 'F:\www\ralphlauren\cookie.txt';
        $root = 'http://leaguepedia.com/api.php?action=query&';
        $url = $root . $url . '&format=json';
        $defaults = array(
//            CURLOPT_POST => 1,
//            CURLOPT_HEADER => 1,
            CURLOPT_URL => $url,
//            CURLOPT_FRESH_CONNECT => 0,
            CURLOPT_RETURNTRANSFER => 1,
//            CURLOPT_FORBID_REUSE => 0,
//            CURLOPT_TIMEOUT => 20,
//            CURLOPT_USERAGENT => 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)',
//            CURLOPT_POSTFIELDS => http_build_query($post),

//            CURLOPT_COOKIEFILE => $cookie,
//            CURLOPT_COOKIEJAR => $cookie,
        );

        $ch = curl_init();
        curl_setopt_array($ch, ($options + $defaults));
        if( ! $result = curl_exec($ch))
        {
            trigger_error(curl_error($ch));
        }
        curl_close($ch);
        
        return json_decode($result, true);
    }
    
    public function getEntityManager()
    {
        if (null === $this->em) {
            $this->em = $this->getServiceLocator()->get('Doctrine\ORM\EntityManager');
        }
        return $this->em;
    } 

    public function indexAction()
    {
        return new ViewModel(array(
            'teams' => $this->findAll('Team'),
        ));
    }

    public function addAction()
    {
        $form = new TeamForm();
        $form->get('submit')->setAttribute('label', 'Add');

        $request = $this->getRequest();
        if ($request->isPost()) {
            $team = new Team();
            
            $form->setInputFilter($team->getInputFilter());
            $form->setData($request->getPost());
            if ($form->isValid()) { 
                $team->populate($form->getData()); 
                $this->getEntityManager()->persist($team);
                $this->getEntityManager()->flush();

                // Redirect to list of teams
                return $this->redirect()->toRoute('team'); 
            }
        }

        return array('form' => $form);
    }

    public function editAction()
    {
        $id = (int)$this->getEvent()->getRouteMatch()->getParam('id');
        if (!$id) {
            return $this->redirect()->toRoute('team', array('action'=>'add'));
        } 
        $team = $this->getEntityManager()->find('Team\Entity\Team', $id);

        $form = new TeamForm();
        $form->setBindOnValidate(false);
        $form->bind($team);
        $form->get('submit')->setAttribute('label', 'Edit');
        
        $request = $this->getRequest();
        if ($request->isPost()) {
            $form->setData($request->getPost());
            if ($form->isValid()) {
                $form->bindValues();
                $this->getEntityManager()->flush();

                // Redirect to list of teams
                return $this->redirect()->toRoute('team');
            }
        }

        return array(
            'id' => $id,
            'form' => $form,
        );
    }

    public function deleteAction()
    {
        $id = (int)$this->getEvent()->getRouteMatch()->getParam('id');
        if (!$id) {
            return $this->redirect()->toRoute('team');
        }

        $request = $this->getRequest();
        if ($request->isPost()) {
            $del = $request->getPost()->get('del', 'No');
            if ($del == 'Yes') {
                $id = (int)$request->getPost()->get('id');
                $team = $this->getEntityManager()->find('Team\Entity\Team', $id);
                if ($team) {
                    $this->getEntityManager()->remove($team);
                    $this->getEntityManager()->flush();
                }
            }

            // Redirect to list of teams
            return $this->redirect()->toRoute('default', array(
                'controller' => 'team',
                'action'     => 'index',
            ));
        }

        return array(
            'id' => $id,
            'team' => $this->getEntityManager()->find('Team\Entity\Team', $id)->getArrayCopy()
        );
    }
    
    public function fetchAllAction()
    {
       
        $regions = $this->curlFetch('titles=Teams&generator=links&prop=links');
        
        $teamNames = array();
        $teamPageIds = array();
        foreach($this->findAll('Team') as $team)
        {
            $teamNames[] = $team->name;
            $teamPageIds[] = $team->lgp_pageId;
        }
        
        $teams = array();
        foreach($regions['query']['pages'] as $region)
        {
            $rootUrlTeams = 'list=categorymembers&cmpageid=' . $region['pageid'];
            $urlTeams = $rootUrlTeams;
            do{
                $fetchedTeams = $this->curlFetch($urlTeams);
                
                //
                $teams = array_merge($teams, $fetchedTeams['query']['categorymembers']);
                $continue = isset($fetchedTeams['query-continue']['categorymembers']['cmcontinue']) ? $fetchedTeams['query-continue']['categorymembers']['cmcontinue']:false;
                $urlTeams = $rootUrlTeams . '&cmcontinue=' . $continue;
                
                foreach($fetchedTeams['query']['categorymembers'] as $teamData)
                {
                    if(!in_array($teamData['title'], $teamNames) && !in_array($teamData['pageid'], $teamPageIds))
                    {
                        $team = new Team();
                        $team->name = $teamData['title'];
                        $team->lgp_pageId = $teamData['pageid'];
                        $team->lgp_regionId = $region['pageid'];
                        $this->getEntityManager()->persist($team);
                    }
                }
                
            } while($continue);
            
//            break;
        }
        
        $this->getEntityManager()->flush();
        
        print_r($teams);
        
        exit;
    }
    
    public function fetchOneAction()
    {
        $teamId = 125;
        $team = $this->findOne('Team', $teamId);
        
        $teamLeaguepediaId = $team->lgp_pageId;
        $page = $this->curlFetch('pageids='.$teamLeaguepediaId.'&prop=revisions&rvprop=content');
        
//        echo '<pre>';
//        print_r($page);
        
        $regexp = "/{{listplayer\|([^|]*)\|([^|]*)\|([^|]*)\|([^|]*)\|{{\{1}}}/";
        $content = $page['query']['pages'][$teamLeaguepediaId]['revisions'][0]['*'];

        preg_match_all($regexp, $content, $matches);
        
        foreach($matches[1] as $k=>$name)
        {
            $player = new Player;
            $player->name = $name;
            $player->realname = $matches[3][$k];
            $player->country = $matches[2][$k];
            $this->getEntityManager()->persist($player);
            
            $rooster = new Rooster;
            $rooster->player = $player;
            $rooster->team = $team;
            $rooster->role = $matches[4][$k];
            $this->getEntityManager()->persist($rooster);
        }
        
        $this->getEntityManager()->flush();
        
        print_r($matches);
        
        exit;
    }
}