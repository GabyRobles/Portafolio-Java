
package utilidad;

import java.io.File;
import java.io.IOException;


import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;


public class UploadObject {

    public void subir(){
        AWSCredentials credentials = new BasicAWSCredentials("AKIAI4FGN4X6FQVIQYOQ", "+wT7u/FBRoTofZFSNG59SGZU96SBAswkLhqFxBeG");
        AmazonS3 s3client = AmazonS3ClientBuilder
                .standard()
                .withCredentials(new AWSStaticCredentialsProvider(credentials))
                .withRegion(Regions.US_EAST_2)
                .build();
        
        String bucketName = "proyectoaura-images";
        /*
        if(s3client.doesBucketExist(bucketName)) {
            LOG.info("Bucket name is not available."
              + " Try again with a different Bucket name.");
            return;
        }

        s3client.createBucket(bucketName);
        
        List<Bucket> buckets = s3client.listBuckets();
        for(Bucket bucket : buckets) {
            System.out.println(bucket.getName());
        }
        */
        s3client.putObject(bucketName,"gym.jpg",new File("/Users/nico_/Pictures/gym.jpg"));
    }
}
