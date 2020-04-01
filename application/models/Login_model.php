<?php

class Login_model extends CI_Model
{
    //cek id dan password futsal
    function auth_futsal($email_futsal, $password_futsal)
    {
        $query = $this->db->query("SELECT * FROM tb_futsal WHERE id_futsal='$email_futsal' AND password_futsal=MD5('$password_futsal') LIMIT 1");
        return $query;
    }

    //cek id dan password pengelola
    function auth_pengelola($email_pengelola, $password_pengelola)
    {
        $query = $this->db->query("SELECT * FROM tb_pengelola WHERE id_pengelola='$email_pengelola' AND password_pengelola=MD5('$password_pengelola') LIMIT 1");
        return $query;
    }
}
