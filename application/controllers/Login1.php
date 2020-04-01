<?php
class Login1 extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('login_model');
    }

    function index()
    {
        $this->load->view('loginView');
    }

    function auth()
    {
        $email = htmlspecialchars($this->input->post('email', TRUE), ENT_QUOTES);
        $password = htmlspecialchars($this->input->post('password', TRUE), ENT_QUOTES);

        $cek_futsal = $this->login_model->auth_dosen($email, $password);

        if ($cek_futsal->num_rows() > 0) { //jika login sebagai pemilik futsal
            $data = $cek_futsal->row_array();
            $this->session->set_userdata('masuk', TRUE);
            if ($data['level'] == '1') { //Akses admin
                $this->session->set_userdata('akses', '1');
                $this->session->set_userdata('ses_id_futsal', $data['id_futsal']);
                $this->session->set_userdata('ses_email_futsal', $data['email_futsal']);
                redirect('page');
            } else { //akses pemilik futsal
                $this->session->set_userdata('akses', '2');
                $this->session->set_userdata('ses_id_futsal', $data['id_futsal']);
                $this->session->set_userdata('ses_email_futsal', $data['email_futsal']);
                redirect('page');
            }
        } else { //jika login sebagai pengelola
            $cek_pengelola = $this->login_model->auth_pengelola($email, $password);
            if ($cek_pengelola->num_rows() > 0) {
                $data = $cek_pengelola->row_array();
                $this->session->set_userdata('masuk', TRUE);
                $this->session->set_userdata('akses', '3');
                $this->session->set_userdata('ses_id_pengelola', $data['id_pengelola']);
                $this->session->set_userdata('ses_email_pengelola', $data['email_pengelola']);
                redirect('page');
            } else {  // jika username dan password tidak ditemukan atau salah
                $url = base_url();
                echo $this->session->set_flashdata('msg', 'Username Atau Password Salah');
                redirect($url);
            }
        }
    }

    function logout()
    {
        $this->session->sess_destroy();
        $url = base_url('');
        redirect($url);
    }
}
