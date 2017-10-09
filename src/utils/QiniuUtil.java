package utils;

import java.io.IOException;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

public class QiniuUtil {
    private static final String ACCESS_KEY = "P5QR0Bj6LXmaceviWRnkgLgbkazR0OCWh8-mCn0H";
    private static final String SECRET_KEY = "EZe-HZ_vjsAYalWpUNooOENWo0Ym_aeZNU3lshV1";

    private static final String bucketname = "xianianjun";

    private static final Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);

    public void upload(String filePath, String fileName) throws IOException {
        UploadManager uploadManager = new UploadManager();
        try {
            Response res = uploadManager.put(filePath, fileName, auth.uploadToken(bucketname));
            // System.out.println(res.bodyString());
        } catch (QiniuException e) {
            Response r = e.response;
            // System.out.println(r.toString());
            try {
                System.out.println(r.bodyString());
            } catch (QiniuException e1) {
                // ignore
            }
        }
    }

    public void delete(String key) throws IOException {
        BucketManager bucketManager = new BucketManager(auth);
        key = key.substring(33);
        try {
            bucketManager.delete(bucketname, key);
        } catch (QiniuException e) {
            Response r = e.response;
            System.out.println(r.toString());
        }
    }
}
