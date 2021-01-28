package member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;


@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public MemberDTO login(Map<String, String> map) {
		return memberDAO.login(map);
	}

	@Override
	public int write(Map<String, String> map) {
		return memberDAO.write(map);
	}

	@Override
	public MemberDTO getMember(String id) {
		return memberDAO.getMember(id);
	}

	@Override
	public List<ZipcodeDTO> getZipcodeList(Map<String, String> map) {
		return memberDAO.getZipcodeList(map);
	}

	@Override
	public void modify(MemberDTO memberDTO) {
		memberDAO.modify(memberDTO);
	}

}
