<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * Popup controller.
 *
 * @package    PNP4Nagios
 * @author     Joerg Linge 
 * @license    GPL
 */
class Popup_Controller extends System_Controller  {


	public function __construct()
	{
		parent::__construct();
		$this->template          = $this->add_view('popup');
		$this->host              = $this->input->get('host');
		$this->service           = $this->input->get('srv');
	}

	public function index()
	{

		$start   = $this->input->get('start');
		$end     = $this->input->get('end');
		$source  = $this->input->get('source');
		$view    = "";

        if(isset($_GET['view']) && $_GET['view'] != "" ){
			$view = pnp::clean($_GET['view']);
		}else{
			$view = $this->config->conf['overview-range'];
		}

		$this->data->getTimeRange($start,$end,$view);

		if(isset($this->host) && isset($this->service)){
			$this->template->host    = $this->host;
			$this->template->srv     = $this->service;
			$this->template->view    = $view;
			$this->template->source  = $source;
			$this->template->end     = $end;
			$this->template->start   = $start;
		}else{
		    url::redirect("/graph");
		}
	}
}
