<?php

class Admin extends CI_Controller
{

    function __construct()
    {
        parent::__construct();

        if ($this->session->userdata('status') != "tb_futsal") {
            redirect(base_url("tb_futsal"));
        }
    }

    function index()
    {
        $this->load->view('adminView');
    }
}
