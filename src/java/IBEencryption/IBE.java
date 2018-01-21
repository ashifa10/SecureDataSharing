package IBEencryption;

import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;

public class IBE {
   
    public static String encrypt(String text , String ownername){
        
        try {
            byte[] raw=ownername.getBytes();
            Key skeySpec = new SecretKeySpec(raw, "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            byte[] iv = new byte[cipher.getBlockSize()];

            IvParameterSpec ivParams = new IvParameterSpec(iv);
            cipher.init(Cipher.ENCRYPT_MODE, skeySpec,ivParams);
            final String encryptedString = DatatypeConverter.printBase64Binary(cipher.doFinal(text.getBytes()));
           
            text=encryptedString;  
        return text;  
        } catch (Exception ex) {
            ex.printStackTrace();
        }
       
        return null;
    }
    
    
    public static String decrypt(String text , String ownername){
         
          
        try {
            byte[] raw=ownername.getBytes();
            Key key = new SecretKeySpec(raw, "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            byte[] ivByte = new byte[cipher.getBlockSize()];
            
            IvParameterSpec ivParamsSpec = new IvParameterSpec(ivByte);
            cipher.init(Cipher.DECRYPT_MODE, key, ivParamsSpec);
            final String decryptedString = new String(cipher.doFinal(DatatypeConverter.parseBase64Binary(text)));
            text=decryptedString;
            return text;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return text;
    }
}
