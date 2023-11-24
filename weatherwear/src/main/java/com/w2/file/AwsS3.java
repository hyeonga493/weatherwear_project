package com.w2.file;

import java.io.File;
import java.io.InputStream;
import java.util.Properties;

import org.springframework.stereotype.Repository;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Repository
public class AwsS3 {

	private AmazonS3 s3Client;
	
	private Properties props;

	private Regions clientRegion = Regions.AP_NORTHEAST_2;
	
	/** 수정 시작 */
	// AWS S3 사용하기 위한 IAM 정보()
	final private String ACCESSKEY = "";
	final private String SECRETKEY = "";
	
	// S3 버킷 이름
	private String bucket = "";
	/** 수정 끝 */
	
	private AwsS3() {
		createS3Client();
	}
	
	static private AwsS3 instance = null;
	
	public static AwsS3 getInstance() {
		if(instance == null) {
			return new AwsS3();
		} else {
			return instance;
		}
	}
	
	// aws S3 Client 생성
	private void createS3Client() {
		AWSCredentials credentials = new BasicAWSCredentials(ACCESSKEY, SECRETKEY);
		
		this.s3Client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials)).withRegion(clientRegion).build();
	}
	
	// 파일 하나 업로드
	public void upload(File file, String key) {
		uploadToS3(new PutObjectRequest(this.bucket, key, file));
	}
	
	// 여러 파일 업로드
	public void upload(InputStream is, String key, String contentType, long contentLength) {
		System.err.println("[ AwsS3 ] : upload()");
		ObjectMetadata objectMetadata = new ObjectMetadata();
		
		objectMetadata.setContentType(contentType);
		objectMetadata.setContentLength(contentLength);
		
		uploadToS3(new PutObjectRequest(this.bucket, key, is, objectMetadata));
	}
	
	// 파일 업로드 메소드
	public void uploadToS3(PutObjectRequest putObjectRequest) {
		System.err.println("[ AwsS3 ] : uploadToS3");
		
		try {
			this.s3Client.putObject(putObjectRequest);
			System.out.println(String.format("[%s] upload complete", putObjectRequest.getKey()));
		} catch (AmazonServiceException e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
