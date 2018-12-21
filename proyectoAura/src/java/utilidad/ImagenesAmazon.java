
package utilidad;

import java.io.File;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;


public class ImagenesAmazon {
    final String BUCKET_NAME = "proyectoaura-images";
    
    public void subirImagen(String name,File file){
        AWSCredentials credentials = new BasicAWSCredentials("AKIAII7TPLEA5ZZ5CEZA", "K5RxZ3rFA69GiIYZhs21mszg++046UDCFUIEZ856");
        AmazonS3 s3client = AmazonS3ClientBuilder
                .standard()
                .withCredentials(new AWSStaticCredentialsProvider(credentials))
                .withRegion(Regions.US_EAST_2)
                .build();
        
        s3client.putObject(new PutObjectRequest(this.BUCKET_NAME,name,file)
                                .withCannedAcl(CannedAccessControlList.PublicRead));
    }
    
    public void borrarImagen(String name){
        AWSCredentials credentials = new BasicAWSCredentials("AKIAII7TPLEA5ZZ5CEZA", "K5RxZ3rFA69GiIYZhs21mszg++046UDCFUIEZ856");
        AmazonS3 s3client = AmazonS3ClientBuilder
                .standard()
                .withCredentials(new AWSStaticCredentialsProvider(credentials))
                .withRegion(Regions.US_EAST_2)
                .build();
        
        s3client.deleteObject(this.BUCKET_NAME,name);
    }
    
    public void reemplazarImagen(String imagenAntigua, File imagenNueva, String name){
        AWSCredentials credentials = new BasicAWSCredentials("AKIAII7TPLEA5ZZ5CEZA", "K5RxZ3rFA69GiIYZhs21mszg++046UDCFUIEZ856");
        AmazonS3 s3client = AmazonS3ClientBuilder
                .standard()
                .withCredentials(new AWSStaticCredentialsProvider(credentials))
                .withRegion(Regions.US_EAST_2)
                .build();
        
        s3client.deleteObject(this.BUCKET_NAME,imagenAntigua);
        s3client.putObject(this.BUCKET_NAME,name,imagenNueva);
    }
    
    public String getURL(String name){
        AWSCredentials credentials = new BasicAWSCredentials("AKIAII7TPLEA5ZZ5CEZA", "K5RxZ3rFA69GiIYZhs21mszg++046UDCFUIEZ856");
        AmazonS3 s3client = AmazonS3ClientBuilder
                .standard()
                .withCredentials(new AWSStaticCredentialsProvider(credentials))
                .withRegion(Regions.US_EAST_2)
                .build();
        
        return s3client.getUrl(BUCKET_NAME, name).toString();
    }
}
