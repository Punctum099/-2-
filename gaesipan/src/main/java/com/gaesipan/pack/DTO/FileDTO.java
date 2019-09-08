package com.gaesipan.pack.DTO;

public class FileDTO {

	private int seq;
	private String board_seq;
	private String original_file_name;
	private String stored_file_name;
	private long file_size;
	private double file_size_kb;
	private String del;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(String board_seq) {
		this.board_seq = board_seq;
	}
	public String getOriginal_file_name() {
		return original_file_name;
	}
	public void setOriginal_file_name(String original_file_name) {
		this.original_file_name = original_file_name;
	}
	public String getStored_file_name() {
		return stored_file_name;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}
	public long getFile_size() {
		return file_size;
	}
	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}
	public double getFile_size_kb() {
		return file_size_kb;
	}
	public void setFile_size_kb(double file_size_kb) {
		this.file_size_kb = file_size_kb;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	
}
