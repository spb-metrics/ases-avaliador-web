package br.com.ases.model.utilities;

import java.io.UnsupportedEncodingException;

public class StringHelper {
	
	/**
	 * @param String
	 * @return String
	 * converte de UTF-8 -> internal Java String format*/
    public static String convertFromUTF8(String s) {
        String out = null;
        try {
            out = new String(s.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            return null;
        }
        return out;
    }
 
    /**
	 * @param String
	 * @return String
	 * convert from internal Java String format -> UTF-8*/
    public static String convertToUTF8(String s) {
        String out = null;
        try {
            out = new String(s.getBytes("UTF-8"), "ISO-8859-1");
        } catch (UnsupportedEncodingException e) {
            return null;
        }
        return out;
    }
}
