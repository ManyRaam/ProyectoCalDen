package proceso;


import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author alegp
 */
public class AES {
   public String decencriptar(String texto) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IOException, IllegalBlockSizeException, BadPaddingException{
       texto = texto.replace(' ','+');
       
          /* TODO output your page here. You may use following sample code. */
            String algo ="AES";
    
     byte[] keyvalue= new byte[] {'e','s','t','a','c','l','a','v','e','e','s','k','a','w','a','i'};
        Key key =   new SecretKeySpec(keyvalue,"AES");
        Cipher c = Cipher.getInstance(algo);

                c.init(Cipher.DECRYPT_MODE,key);
                 byte[] deencrypt =new BASE64Decoder().decodeBuffer(texto);
                byte[] encValue = c.doFinal(deencrypt);
           String val= new String(encValue);
           return val;
       
   }
   public String encriptar(String texto) throws NoSuchAlgorithmException, InvalidKeyException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException{
        String algo ="AES";
     byte[] keyvalue= new byte[] {'e','s','t','a','c','l','a','v','e','e','s','k','a','w','a','i'};
        Key key =   new SecretKeySpec(keyvalue,"AES");
        Cipher c = Cipher.getInstance(algo);
                c.init(Cipher.ENCRYPT_MODE,key);
                byte[ ] enc = c.doFinal(texto.getBytes());
                     String encrypt =new BASE64Encoder().encode(enc);
                     return encrypt;
   }
   
}
