/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dao.ClassDAO;

/**
 *
 * @author dell
 */
public class Test {

    private int testID;
    private String testName;
    private int classID;
    private String testContent;
    private int difficulty;

    public Test(int testID, String testName, int classID, String testContent, int difficulty) {
        this.testID = testID;
        this.testName = testName;
        this.classID = classID;
        this.testContent = testContent;
        this.difficulty = difficulty;
    }

    public Test() {
    }

    public int getTestID() {
        return testID;
    }

    public void setTestID(int testID) {
        this.testID = testID;
    }

    public String getTestName() {
        return testName;
    }

    public void setTestName(String testName) {
        this.testName = testName;
    }

    public int getClassID() {
        return classID;
    }

    public void setClassID(int classID) {
        this.classID = classID;
    }

    public String getTestContent() {
        return testContent;
    }

    public void setTestContent(String testContent) {
        this.testContent = testContent;
    }

    public int getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(int difficulty) {
        this.difficulty = difficulty;
    }

    public Classes getClasses() throws Exception {
        ClassDAO ClassDAO = new ClassDAO();
        return ClassDAO.getClasses(classID);
    }
}
