package service;

public interface UserService {

    String getUserList();

    String info(int user_id);

    String stopUser(int user_id);

    String startUser(int user_id);

    Boolean LoginUser(String username, String password);


}
