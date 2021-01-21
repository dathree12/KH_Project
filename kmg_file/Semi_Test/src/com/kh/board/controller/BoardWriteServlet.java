package com.kh.board.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.common.util.FileRename;
import com.kh.member.model.vo.Member;
//import com.kh.mvc.common.util.FileRename;
//import com.kh.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/board/write")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardWriteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/common/enroll.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String msg = null;
		
		// 파일이 저장될 경로 
		String path = getServletContext().getRealPath("/image");
		
		// 파일의 사이즈 지정
		int maxSize = 1024 * 1024 * 10;
		
		// 문자에 대한 인코딩 값 설정
		String encoding = "UTF-8";
		

		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());

		// 클라이언트 폼 파라미터로 넘어온 값들(파일에 대한 정보X) 
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");	
		String veganlist = mr.getParameter("veganlist");
		String situation[] = mr.getParameterValues("situation");
		String writer = mr.getParameter("writer");
		
		//배열값을 문자열로 변환 
		String str = Arrays.toString(situation);
		
		
//		// 파일에 대한 정보를 가져올 때
		String boardImageFile = mr.getOriginalFileName("boardImageFile");	
		String imagefile1 = mr.getOriginalFileName("imagefile1");		
		String imagefile2 = mr.getOriginalFileName("imagefile2");		
		String imagefile3 = mr.getOriginalFileName("imagefile3");		
	

		// 로그인 안된 사용자나 다른 사용자가 접근해서 게시글 작성이 가능하기 때문에 로그인 체크를 위한 로그인 정보
		HttpSession session = request.getSession(false);
		Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
				
		System.out.println(loginMember);
			
		if (loginMember != null) {			
			if(loginMember.getUserId().equals(writer)) {
				Board board = new Board();
				
				board.setBoardTitle(title);
				board.setBoardContent(content);
				board.setBoardImageFile(boardImageFile);
				board.setVeganlist(veganlist);
				board.setSituaion(str);
				board.setImagefile1(imagefile1);
				board.setImagefile2(imagefile2);
				board.setImagefile3(imagefile3);
				board.setBoardWriteNo(loginMember.getUserNo());
				
				System.out.println(board);
				
				int result = new BoardService().saveBoard(board);
				
				if(result > 0) {
					msg = "게시글 등록 성공";			
					
				} else {
					msg = "게시글 등록 실패";			
				}
			} else {
				msg = "잘못된 접근입니다.";
			}
		} else {
			msg = "로그인 진행 후 작성해주세요. ";
		}
	
		request.setAttribute("msg", msg);
		request.setAttribute("location", "");
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	
	}
}