<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Login extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('loginModel');
    }

    function index()
    {
        $this->load->view('loginView');
    }

    function aksi_login()
    {
        $email = $this->input->post('email_futsal');
        $password = $this->input->post('password_futsal');
        $where = array(
            'email_futsal' => $email,
            'password_futsal' => md5($password)
        );
        $cek = $this->loginModel->cek_login("tb_futsal", $where)->num_rows();
        if ($cek > 0) {

            $data_session = array(
                'nama' => $email,
                'status' => "login"
            );

            $this->session->set_userdata($data_session);

            redirect(base_url("tb_futsal"));
        } else {
            echo "Username dan password salah !";
        }
    }

    function logout()
    {
        $this->session->sess_destroy();
        redirect(base_url('tb_futsal'));
    }
}
