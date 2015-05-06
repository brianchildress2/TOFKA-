package edu.acc.j2ee.tofka.jpa;

import java.sql.Date;

public class CurrentDate {
    public static Date now() {
        return new Date(new java.util.Date().getTime());
    }
}