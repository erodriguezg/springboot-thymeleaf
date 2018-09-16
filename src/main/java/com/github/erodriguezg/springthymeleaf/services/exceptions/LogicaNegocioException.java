package com.github.erodriguezg.springthymeleaf.services.exceptions;

public class LogicaNegocioException extends RuntimeException {

    private final String code;

    private final String[] args;

    public LogicaNegocioException(String code, String[] args) {
        this.code = code;
        this.args = args;
    }

    public String getCode() {
        return code;
    }

    public String[] getArgs() {
        return args;
    }
}
