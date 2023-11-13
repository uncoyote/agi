package multijar.constraint;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

public class MyConstraint {

    public static String loadTxtFileContent(String textFileName){
        String res = null;

        InputStream is = null;
        try{
            is = Class.forName("multijar.app.App").getResourceAsStream(textFileName);
            byte[] dat = is.readAllBytes();
            res = new String(dat, StandardCharsets.UTF_8);
        }
        catch (Exception e){
            throw new RuntimeException(e);
        }
        finally {
            if(is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        return res;
    }
}
