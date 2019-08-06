package service;

import pojo.User;

import java.util.List;

public interface UserService {

    String getUserList();

    String info(int user_id);

    String stopUser(int user_id);

    String startUser(int user_id);
}
