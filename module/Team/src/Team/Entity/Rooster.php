<?php

namespace Team\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\ManyToOne;
use Doctrine\ORM\Mapping\JoinColumn;

/**
 * A team.
 *
 * @ORM\Entity
 * @ORM\Table(name="rooster")
 * @property int $id
 */
class Rooster
{
    protected $inputFilter;

    /**
     * @ORM\Id
     * @ORM\Column(type="integer");
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @ORM\Column(type="string")
     */
    protected $role;

    /**
     * @var Player
     * @ManyToOne(targetEntity="Player", inversedBy="roosters")
     * @JoinColumn(name="ide_player", referencedColumnName="id", nullable=false)
     */
    protected $player;

    /**
     * @var Team
     * @ManyToOne(targetEntity="Team", inversedBy="roosters")
     * @JoinColumn(name="ide_team", referencedColumnName="id", nullable=false)
     */
    protected $team;

    /**
     * @ORM\Column(type="date") 
     */
    protected $dateEnd;

    /**
     * @ORM\Column(type="date") 
     */
    protected $dateStart;

    /**
     * Magic getter to expose protected properties.
     *
     * @param string $property
     * @return mixed
     */
    public function __get($property) 
    {
        return $this->$property;
    }

    /**
     * Magic setter to save protected properties.
     *
     * @param string $property
     * @param mixed $value
     */
    public function __set($property, $value) 
    {
        $this->$property = $value;
    }

    /**
     * Convert the object to an array.
     *
     * @return array
     */
    public function getArrayCopy() 
    {
        return get_object_vars($this);
    }
    
    /**
     * 
     * @return bool
     */
    public function isActive()
    {
        return $this->dateEnd ? false:true;
    }
}