/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author dell
 */
public class UserResponse {

    private int responseID;
    private int userID;
    private String title;
    private String responseContent;

    public UserResponse() {
    }

    public UserResponse(int responseID, int userID, String title, String responseContent) {
        this.responseID = responseID;
        this.userID = userID;
        this.title = title;
        this.responseContent = responseContent;
    }

    public int getResponseID() {
        return responseID;
    }

    public void setResponseID(int responseID) {
        this.responseID = responseID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getResponseContent() {
        return responseContent;
    }

    public void setResponseContent(String responseContent) {
        this.responseContent = responseContent;
    }

}
