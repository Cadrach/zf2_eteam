<?php

namespace Team\Controller;

use Zend\Mvc\Controller\AbstractActionController,
    Zend\View\Model\ViewModel, 
    Team\Form\TeamForm,
    Doctrine\ORM\EntityManager,
    Team\Entity\Team;

class TeamController extends AbstractActionController
{
    /**
     * @var Doctrine\ORM\EntityManager
     */
    protected $em;

    public function setEntityManager(EntityManager $em)
    {
        $this->em = $em;
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
            'teams' => $this->getEntityManager()->getRepository('Team\Entity\Team')->findAll() 
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
            $form->setData($request->post());
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
            $form->setData($request->post());
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
            $del = $request->post()->get('del', 'No');
            if ($del == 'Yes') {
                $id = (int)$request->post()->get('id');
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
}