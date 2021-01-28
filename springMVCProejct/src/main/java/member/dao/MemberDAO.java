package member.dao;

import java.util.List;
import java.util.Map;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;


public interface MemberDAO {

	public MemberDTO login(Map<String, String> map);

	public int write(Map<String, String> map);

	public MemberDTO getMember(String id);

	public List<ZipcodeDTO> getZipcodeList(Map<String, String> map);

	public void modify(MemberDTO memberDTO);

}
