package com.projet.cinepax.utils;

import com.google.common.hash.Hashing;
import java.nio.charset.StandardCharsets;

public class Util {
    
    public Util()
    {
        
    }

    public String hashMdp(String originalString)
    {
        String sha256hex = Hashing.sha256()
            .hashString(originalString, StandardCharsets.UTF_8)
            .toString();

        return sha256hex;
    }
}
