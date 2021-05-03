import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main")
public class Main extends HttpServlet {

	static String cardNumber = "";

	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		PrintWriter out = res.getWriter();

		String url = "jdbc:mysql://localhost:3306/lbms";
		String uname = "root";
		String pass = "root@1234";

		HashMap<Integer, HashMap<String, Integer>> posMap = new HashMap<Integer, HashMap<String, Integer>>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Connection con = null;

		try {
			con = (Connection) DriverManager.getConnection(url, uname, pass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

//		if(req.getParameter("person-type")!=null && req.getParameter("person-type").equals("reader")) {
//			System.out.println("Reader selected");
//
//			ServletContext sc = getServletContext();
//			sc.getRequestDispatcher("/reader.html").forward(req, res);
//		}
//		
//		if(req.getParameter("person-type")!=null && req.getParameter("person-type").equals("administrator")) {
//			System.out.println("Administrator selected");
//			
//			ServletContext sc = getServletContext();
//			sc.getRequestDispatcher("/administrator.html").forward(req, res);
//		}

		if (req.getParameter("action-submit-reader") != null) {
			System.out.println("Reader selected");

			ServletContext sc = getServletContext();

			Statement statement = null;
			ResultSet resultSet = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			String query = "select * from reader where rid=" + req.getParameter("card-number");
			cardNumber = req.getParameter("card-number");
			System.out.println(query);

			try {
				resultSet = statement.executeQuery(query);
				if (resultSet.next()) {
					sc.getRequestDispatcher("/reader.jsp").forward(req, res);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println("<html><body><center><h1>Invalid Reader ID!</h1></center></body></html>");
//				e.printStackTrace();
			}

		}

		if (req.getParameter("action-submit-admin") != null) {
			System.out.println("Administrator selected");

			ServletContext sc = getServletContext();

			Statement statement = null;
			ResultSet resultSet = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			String query = "select * from admins where adminid=" + req.getParameter("administrator-id") + " and pwd="
					+ req.getParameter("administrator-pwd");
			System.out.println(query);

			try {
				resultSet = statement.executeQuery(query);
				if (resultSet.next()) {
					sc.getRequestDispatcher("/administrator.jsp").forward(req, res);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println("<html><body><center><h1>Invalid Administrator ID!</h1></center></body></html>");
			}
		}

		if (req.getParameter("inreader-submit-1") != null) {
			System.out.println("In Reader Submit Selected");

			/*
			 * Insert table for showing document details
			 */
			String document_id = req.getParameter("document-id");
			String document_title = req.getParameter("document-title");
			String document_pubname = req.getParameter("document-pubname");
			String document_query = "";

			System.out.println(document_id);
			System.out.println(document_title);
			System.out.println(document_pubname);

			Statement statement = null;
			ResultSet resultSet = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (!document_id.equals("") && document_title.equals("") && document_pubname.equals("")) {
				document_query = "select * from document where docid=" + document_id;
				System.out.println(document_query);
				try {
					synchronized (statement) {
						resultSet = statement.executeQuery(document_query);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					out = res.getWriter();
					out.println(
							"<!DOCTYPE html><body style=\"background-color: rgb(235, 236, 205); padding: 10px; text-align: center;\"><code><font size=\"3.5\"><table cellspacing=\"3\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 50%; height: 25%; border: 1px solid black\"");
					out.println("<tr style=\"border: 1px solid black\">");
					out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Document ID</b>"
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Document Title</b>"
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Publishing Date</b>"
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Publisher Id</b>");
					out.println("</tr>");
					while (resultSet.next()) {
						out.println("<tr style=\"border: 1px solid black\">");
						out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(1)
								+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(2)
								+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(3)
								+ "</td>><td style=\"border: 1px solid black; padding: 15px;\">"
								+ resultSet.getString(4));
						out.println("</tr>");
					}
					out.println("</table></font>");
					out.println("</code></body></html>");

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (document_id.equals("") && !document_title.equals("") && document_pubname.equals("")) {
				document_query = "select * from document where title=\"" + document_title + "\"";
				try {
//					statement = (Statement) con.createStatement();
					synchronized (statement) {
						resultSet = statement.executeQuery(document_query);
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					out = res.getWriter();
					out.println(
							"<!DOCTYPE html><body style=\"background-color: rgb(235, 236, 205); padding: 10px; text-align: center;\"><code><font size=\"3.5\"><table cellspacing=\"3\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 50%; height: 25%; border: 1px solid black\"");
					out.println("<tr style=\"border: 1px solid black\">");
					out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Document ID</b>"
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Document Title</b>"
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Publishing Date</b>"
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Publisher Id</b>");
					out.println("</tr>");
					while (resultSet.next()) {
						out.println("<tr style=\"border: 1px solid black\">");
						out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(1)
								+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(2)
								+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(3)
								+ "</td>><td style=\"border: 1px solid black; padding: 15px;\">"
								+ resultSet.getString(4));
						out.println("</tr>");
					}
					out.println("</table></font>");
					out.println("</code></body></html>");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				document_query = "select * from document d, publisher p where d.publisherid=p.publisherid and p.pubname=\""
						+ document_pubname + "\"";
				System.out.println(document_query);
				try {
					synchronized (statement) {
						resultSet = statement.executeQuery(document_query);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					out = res.getWriter();
					out.println(
							"<!DOCTYPE html><body style=\"background-color: rgb(235, 236, 205); padding: 10px; text-align: center;\"><code><font size=\"3.5\"><table cellspacing=\"3\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 50%; height: 25%; border: 1px solid black\"");
					out.println("<tr style=\"border: 1px solid black\">");
					out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Document ID</b>"
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Document Title</b>"
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Publishing Date</b>"
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Publisher Id</b>");
					out.println("</tr>");
					while (resultSet.next()) {
						out.println("<tr style=\"border: 1px solid black\">");
						out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(1)
								+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(2)
								+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(3)
								+ "</td>><td style=\"border: 1px solid black; padding: 15px;\">"
								+ resultSet.getString(4));
						out.println("</tr>");
					}
					out.println("</table></font>");
					out.println("</code></body></html>");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}

		if (req.getParameter("inreader-submit-2") != null) {
			System.out.println("In reader2");
			ResultSet resultSet = null;
			Statement statement = null;
			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			String reader_id = req.getParameter("reader-id");
			String reader_name = req.getParameter("reader-name");
			String reader_address = req.getParameter("reader-address");
			String reader_phone = req.getParameter("reader-phone");
			String reader_doc = req.getParameter("reader-doc-reserve");

			String checkInReserves = "select * from reserves where rid=" + reader_id + " and docid=" + reader_doc;
			String res_no = "";
			String docIdInReserves = "";
			String copyNoInReserves = "";
			String bidInReserves = "";
			int flag = 0;
			System.out.println(checkInReserves);
			try {
				resultSet = statement.executeQuery(checkInReserves);
				if (resultSet.next()) {
					flag = 1;

					res_no = resultSet.getString(2);
					docIdInReserves = resultSet.getString(3);
					copyNoInReserves = resultSet.getString(4);
					bidInReserves = resultSet.getString(5);

					System.out.println(res_no);
					System.out.println(docIdInReserves);
					System.out.println(copyNoInReserves);
					System.out.println(bidInReserves);
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			String rtime = "";
			String checkout_query = "";
			ResultSet resultSetForLength = null;
			int borno = 0;
			Date date = new Date();
			Timestamp ts = new Timestamp(date.getTime());

			if (flag == 1) {
				checkInReserves = "select * from reservation where res_no=" + res_no;
				try {
					resultSet = statement.executeQuery(checkInReserves);
					if (resultSet != null) {
						resultSet.next();
						rtime = resultSet.getString(2);
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				checkout_query = "select docid, copyno, bid from copy where (docid,copyno,bid) not in (select docid, copyno, bid from borrows where docid="
						+ docIdInReserves + ") and docid=" + docIdInReserves;
				System.out.println(checkout_query);
				try {
					resultSet = statement.executeQuery(checkout_query);

					if (resultSet.next()) {
						docIdInReserves = resultSet.getString(1);
						copyNoInReserves = resultSet.getString(2);
						bidInReserves = resultSet.getString(3);
						flag = 2;

						System.out.println("DocId: " + docIdInReserves);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				checkout_query = "select * from borrows";

				resultSetForLength = null;

				synchronized (statement) {
					try {
						resultSetForLength = statement.executeQuery(checkout_query);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}

				borno = 0;
				try {
					while (resultSetForLength.next()) {
						borno = Math.max(borno, Integer.parseInt(resultSetForLength.getString(1)));
						System.out.println("Bor no:" + borno);
					}
				} catch (NumberFormatException | SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				borno = borno + 1;

				date = new Date();
				ts = new Timestamp(date.getTime());

				if (flag == 2) {

					checkout_query = "insert into borrowing values(" + borno + ",\'" + ts + "\', \'" + rtime + "\')";
					System.out.println(checkout_query);
					try {
						statement.executeUpdate(checkout_query);
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}

					checkout_query = "insert into borrows values(" + borno + "," + docIdInReserves + ", "
							+ copyNoInReserves + ", " + bidInReserves + ", " + Integer.parseInt(reader_id) + ")";
					System.out.println(checkout_query);
					try {
						statement.executeUpdate(checkout_query);
						out.println(
								"<html><body><center><h1>Document successfully checked out!</h1></center></body></html>");
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
//						e1.printStackTrace();
					}

					reserveDocument(req, res, con, reader_id, reader_name, reader_address, reader_phone, reader_doc);
				} else {
					out.println("<html><body><center><h1>Document not available!</h1></center></body></html>");
				}
			}

			if (flag == 0) {
				reserveDocument(req, res, con, reader_id, reader_name, reader_address, reader_phone, reader_doc);

				checkInReserves = "select * from reserves where rid=" + reader_id + " and docid=" + reader_doc;
				res_no = "";
				docIdInReserves = "";
				copyNoInReserves = "";
//				bidInReserves = "";
				System.out.println(checkInReserves);
				try {
					resultSet = statement.executeQuery(checkInReserves);
					if (resultSet.next()) {
						flag = 1;
						res_no = resultSet.getString(2);
						docIdInReserves = resultSet.getString(3);
						copyNoInReserves = resultSet.getString(4);
						bidInReserves = resultSet.getString(5);

						System.out.println("see" + docIdInReserves);
						System.out.println("see" + copyNoInReserves);
						System.out.println("see" + bidInReserves);

					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				checkInReserves = "select * from reservation where res_no=" + res_no;
				System.out.println(checkInReserves);

				rtime = "";
				try {
					resultSet = statement.executeQuery(checkInReserves);
					if (resultSet != null) {
						resultSet.next();
						rtime = resultSet.getString(2);
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				checkout_query = "";
				checkout_query = "select * from borrowing";

				resultSetForLength = null;

				synchronized (statement) {
					try {
						resultSetForLength = statement.executeQuery(checkout_query);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}
				borno = 0;
				try {
					while (resultSetForLength.next()) {
						borno = Math.max(borno, Integer.parseInt(resultSetForLength.getString(1)));
						System.out.println(borno);
					}
				} catch (NumberFormatException | SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				borno = borno + 1;

				date = new Date();
				ts = new Timestamp(date.getTime());

				if (rtime.equals("")) {
					checkout_query = "insert into borrowing values(" + borno + ",\'" + ts + "\', \'" + ts + "\')";
				} else {
					checkout_query = "insert into borrowing values(" + borno + ",\'" + ts + "\', \'" + rtime + "\')";
				}
				System.out.println(checkout_query);
				try {
					statement.executeUpdate(checkout_query);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				checkout_query = "insert into borrows values(" + borno + "," + reader_doc + ", " + copyNoInReserves
						+ ", " + bidInReserves + ", " + Integer.parseInt(reader_id) + ")";
				System.out.println(checkout_query);
				try {
					statement.executeUpdate(checkout_query);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				out.println("<html><body><center><h1>Document successfully checked out!</h1></center></body></html>");

			}
		}

		if (req.getParameter("inreader-submit-3") != null) {
			int rid = Integer.parseInt(req.getParameter("doc-return-rid"));
			int docid = Integer.parseInt(req.getParameter("doc-return-docid"));
			int bid = Integer.parseInt(req.getParameter("doc-return-bid"));
			Statement statement = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			String getBorNo = "select bor_no from borrows where rid=" + rid + " and docid=" + docid + " and bid=" + bid;
			String queryForBorrows = "delete from borrows where rid=" + rid + " and docid=" + docid + " and bid=" + bid;

			String getResNo = "select reservation_no from reserves where rid=" + rid + " and docid=" + docid
					+ " and bid=" + bid;
			String queryForReserves = "delete from reserves where rid=" + rid + " and docid=" + docid + " and bid="
					+ bid;

			// write insert query with position
			int borno = -1;
			int res_no = -1;
			try {

				ResultSet resultSet = statement.executeQuery(getBorNo);
				if (resultSet.next()) {
					borno = Integer.parseInt(resultSet.getString(1));
				}

				resultSet = statement.executeQuery(getResNo);
				if (resultSet.next()) {
					res_no = Integer.parseInt(resultSet.getString(1));
				}

				String queryForBorrowing = "delete from borrowing where bor_no=" + borno;
				String queryForReservation = "delete from reservation where res_no=" + res_no;

				statement.executeUpdate(queryForBorrows);
				statement.executeUpdate(queryForBorrowing);
				statement.executeUpdate(queryForReserves);
				statement.executeUpdate(queryForReservation);

				out.println("<html><body><center><h1>Document successfully returned!</h1></center></body></html>");

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (req.getParameter("inreader-submit-4") != null) {
			int rid = Integer.parseInt(req.getParameter("fine-rid"));
			int docid = Integer.parseInt(req.getParameter("fine-docid"));
			int bid = Integer.parseInt(req.getParameter("fine-bid"));
			Statement statement = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			String queryForFine = "select DAY(bdtime), MONTH(bdtime), YEAR(bdtime) from borrows b1, borrowing b2 where b1.bor_no=b2.bor_no and b1.rid="
					+ rid + " and b1.docid=" + docid + " and b1.bid=" + docid;
			// write insert query with position
			System.out.println(queryForFine);
			int year = -1;
			int month = -1;
			int day = -1;
			try {

				ResultSet resultSet = statement.executeQuery(queryForFine);
				if (resultSet.next()) {
					day = Integer.parseInt(resultSet.getString(1));
					month = Integer.parseInt(resultSet.getString(2));
					year = Integer.parseInt(resultSet.getString(3));
				}

				int nowYear = LocalDate.now().getYear();
				int nowMonth = LocalDate.now().getMonthValue();
				int nowDay = LocalDate.now().getDayOfMonth();

				double fine = ((nowYear - year) * LocalDate.now().lengthOfMonth())
						+ ((nowMonth - month) * LocalDate.now().lengthOfMonth()) + (nowDay - day);
				fine = (fine - 20) * 0.2;

				out.println("<html><body>");
				out.println("<center><h1>Fine Computed: $" + fine + "</h1></center></body></html>");
				out.println("</body></html>");

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (req.getParameter("inreader-submit-5") != null) {
			String pubName = req.getParameter("pname");
			Statement statement = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			String queryForDocIdTitles = "select d.docid, d.title from document d, publisher p where d.publisherid=p.publisherid and p.pubname=\'"
					+ pubName + "\'";
			// write insert query with position
			System.out.println(queryForDocIdTitles);

			try {
				ResultSet resultSet = statement.executeQuery(queryForDocIdTitles);
				out = res.getWriter();
				out.println(
						"<!DOCTYPE html><body style=\"background-color: rgb(235, 236, 205); padding: 10px; text-align: center;\"><code><font size=\"3.5\"><table cellspacing=\"3\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 50%; height: 25%; border: 1px solid black\"");
				while (resultSet.next()) {
					out.println("<tr style=\"border: 1px solid black\">");
					out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(1)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(2)
							+ "</td>");
					out.println("</tr>");
				}
				out.println("</table></font>");
				out.println("</code></body></html>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (req.getParameter("inreader-submit-6") != null) {
			System.out.println("In reader2");
			ResultSet resultSet = null;
			Statement statement = null;
			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			;

			String reader_id = req.getParameter("reader-id-reserve");
			String reader_name = req.getParameter("reader-name-reserve");
			String reader_address = req.getParameter("reader-address-reserve");
			String reader_phone = req.getParameter("reader-phone-reserve");
			String reader_doc = req.getParameter("reader-doc-reserve");
			String checkout_query = "";

			if (!reader_id.equals("")) {
				checkout_query = "select * from reader where rid=" + reader_id;
			} else if (!reader_name.equals("")) {
				checkout_query = "select * from reader where rname=\'" + reader_name + "\'";
			} else if (!reader_address.equals("")) {
				checkout_query = "select * from reader where raddress=\'" + reader_address + "\'";
			} else if (!reader_phone.equals("")) {
				checkout_query = "select * from reader where phone_no=\'" + reader_phone + "\'";
			}
			System.out.println(checkout_query);
			try {
				resultSet = statement.executeQuery(checkout_query);
				System.out.println("Reader exists!");
				if (resultSet != null) {
					resultSet.next();
					reader_id = resultSet.getString(1);
					checkout_query = "select * from copy where docid=" + reader_doc;
					resultSet = statement.executeQuery(checkout_query);

					if (resultSet != null) {
						resultSet.next();
						int docid = Integer.parseInt(resultSet.getString(1));
						int copyno = Integer.parseInt(resultSet.getString(2));
						int bid = Integer.parseInt(resultSet.getString(3));

						checkout_query = "select * from reserves";

						ResultSet resultSetForLength = null;

						synchronized (statement) {
							resultSetForLength = statement.executeQuery(checkout_query);

						}
						int borno = 0;
						while (resultSetForLength.next()) {
							borno = Math.max(borno, Integer.parseInt(resultSetForLength.getString(1)));
						}
						borno = borno + 1;

						// code here for conditions
						checkout_query = "select docid, copyno, bid from copy where (docid,copyno,bid) not in (select docid, copyno, bid from reserves where docid="
								+ reader_doc + ") and docid=" + reader_doc + "";
						System.out.println(checkout_query);
						resultSet = statement.executeQuery(checkout_query);
						int flag = 0;
						if (resultSet.next()) {
							docid = Integer.parseInt(resultSet.getString(1));
							copyno = Integer.parseInt(resultSet.getString(2));
							bid = Integer.parseInt(resultSet.getString(3));
							flag = 1;
						}

						Date date = new Date();
						Timestamp ts = new Timestamp(date.getTime());

						if (flag == 1) {
							checkout_query = "insert into reservation values(" + borno + ",\'" + ts + "\')";
							statement.executeUpdate(checkout_query);

							checkout_query = "insert into reserves values(" + Integer.parseInt(reader_id) + "," + borno
									+ ", " + docid + ", " + copyno + ", " + bid + ")";
							statement.executeUpdate(checkout_query);

							out.println(
									"<html><body><center><h1>Document successfully reserved!</h1></center></body></html>");
						} else {

							out.println(
									"<html><body><center><h1>Document copy not available for reservation!</h1></center></body></html>");
						}
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (req.getParameter("inreader-submit-7") != null) {
			String rid = req.getParameter("reader-id");
			Statement statement = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			String query1 = "drop view if exists r1";
			System.out.println(query1);
			String query2 = "create view r1 as select r.rid, r.reservation_no, r.docid, r.copyno, r.bid, b.bor_no from reserves as r left join borrows as b on r.rid=b.rid and r.docid=b.docid where b.rid="
					+ rid + " or bor_no is null";
			System.out.println(query2);
			String query3 = "select * from r1 where rid=" + rid + " and (docid, copyno, bid, bor_no) in (select\n"
					+ "docid, copyno, bid, bor_no from borrows)";
			System.out.println(query3);

			try {
				statement.executeUpdate(query1);
				statement.executeUpdate(query2);
				ResultSet resultSet = statement.executeQuery(query3);

				out = res.getWriter();
				out.println(
						"<!DOCTYPE html><body style=\"background-color: rgb(235, 236, 205); padding: 10px; text-align: center;\"><code><font size=\"3.5\"><table cellspacing=\"3\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 50%; height: 25%; border: 1px solid black\"");
				out.println("<tr style=\"border: 1px solid black\">");
				out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Document ID</b>"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Copy Number</b>"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Reservation Number</b>"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">"
						+ "<b>Borrowing Status/Number</b>");
				out.println("</tr>");
				while (resultSet.next()) {
					out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(3)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(4)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(2)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(6));
					out.println("</tr>");
				}
				out.println("</table></font>");
				out.println("</code></body></html>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		if (req.getParameter("inadmin-submit-1") != null) {
			int docid = Integer.parseInt(req.getParameter("add-docid"));
			int bid = Integer.parseInt(req.getParameter("add-bid"));
			String pos = req.getParameter("add-pos");

			Statement statement = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			String query = "select copyno from copy where docid=" + docid + " and bid=" + bid;
			int copyno = -1;
			try {
				ResultSet resultSet = statement.executeQuery(query);
				while (resultSet.next()) {
					copyno = Integer.parseInt(resultSet.getString(1));
				}
				copyno = copyno + 1;

				query = "insert into copy values(" + docid + ", " + copyno + ", " + bid + ", \'" + pos + "\')";
				System.out.println(query);
				int rowsAffected = statement.executeUpdate(query);
				if (rowsAffected != -1) {
					out.println(
							"<html><body><center><h1>Document copy successfully added!</h1></center></body></html>");
				} else {
					out.println("<html><body><center><h1>Document copy not added!</h1></center></body></html>");
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		if (req.getParameter("inadmin-submit-2") != null) {
			int docid = Integer.parseInt(req.getParameter("sc-docid"));
			String query = "select * from copy c, borrows b, borrowing bo where c.docid=b.docid and c.copyno=b.copyno and c.bid=b.docid and b.bor_no=bo.bor_no and c.docid="
					+ docid;

			Statement statement = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			try {
				ResultSet resultSet = statement.executeQuery(query);
//				out.println("<html><body><h1>Copy Information</h1>");
//				out.println("DocID " + "CopyNo " + "BranchID " + "Position " + "BorNo " + "ReaderID "
//						+ "Borrow Time Stamp " + "Reservation Time Stamp<br>");
//				while (resultSet.next()) {
//					out.println(resultSet.getString(1) + " " + resultSet.getString(2) + " " + resultSet.getString(3)
//							+ " " + resultSet.getString(4) + " " + resultSet.getString(5) + " "
//							+ resultSet.getString(10) + " " + resultSet.getString(11) + "<br>");
//				}
//				out.println("</body></html>");

				out = res.getWriter();
				out.println(
						"<!DOCTYPE html><body style=\"background-color: rgb(235, 236, 205); padding: 10px; text-align: center;\"><code><font size=\"3.5\"><table cellspacing=\"3\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 50%; height: 25%; border: 1px solid black\"");
				out.println("<tr style=\"border: 1px solid black\">");
				out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Document ID</b>"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Copy No</b>"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Branch ID</b>"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Position</b>"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Borrow Number</b>"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Reader ID</b>"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Borrow Timestamp</b>"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Reservation Timestamp</b>"
						+ "</td>");
				out.println("</tr>");
				while (resultSet.next()) {
					out.println("<tr style=\"border: 1px solid black\">");
					out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(1)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(2)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(3)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(4)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(5)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(10)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(11)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(12)
							+ "</td>");
					out.println("</tr>");
				}
				out.println("</table></font>");
				out.println("</code></body></html>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		if (req.getParameter("inadmin-submit-3") != null) {
			String rtype = req.getParameter("rtype");
			String rname = req.getParameter("rname");
			String raddress = req.getParameter("raddress");
			int rcontact = Integer.parseInt(req.getParameter("rcontact"));

			int rid = -1;
			String query = "select rid from reader";

			Statement statement = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			try {
				ResultSet resultSet = statement.executeQuery(query);
				while (resultSet.next()) {
					rid = Integer.parseInt(resultSet.getString(1));
				}
				rid = rid + 1;

				query = "insert into reader values(" + rid + ",\'" + rtype + "\', \'" + rname + "\', \'" + raddress
						+ "\', " + rcontact + ")";
				System.out.println(query);
				statement.executeUpdate(query);
				out.println("<html><body><center><h1>Reader successfully added!</h1></center></body></html>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		if (req.getParameter("inadmin-submit-4") != null) {
			int bid = Integer.parseInt(req.getParameter("bid"));
			String query = "select * from branch where bid=" + bid;

			Statement statement = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			try {
				ResultSet resultSet = statement.executeQuery(query);
				out = res.getWriter();
				out.println(
						"<!DOCTYPE html><body style=\"background-color: rgb(235, 236, 205); padding: 10px; text-align: center;\"><code><font size=\"3.5\"><table cellspacing=\"3\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 50%; height: 25%; border: 1px solid black\"");
				out.println("<tr style=\"border: 1px solid black\">");
				out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + "Branch Name"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "Branch Location" + "</td>");
				out.println("</tr>");
				while (resultSet.next()) {
					out.println("<tr style=\"border: 1px solid black\">");
					out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(2)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(3)
							+ "</td>");
					out.println("</tr>");
				}
				out.println("</table></font>");
				out.println("</code></body></html>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		if (req.getParameter("inadmin-submit-5") != null) {
			int bid = Integer.parseInt(req.getParameter("bid"));
			int n = Integer.parseInt(req.getParameter("n"));

			String query = "select b.rid, r.rname, count(*) from borrows b, reader r where b.rid = r.rid and b.bid="
					+ bid + " group by b.rid, r.rname order by count(*) desc limit " + n;

			Statement statement = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			try {
				ResultSet resultSet = statement.executeQuery(query);
				out = res.getWriter();
				out.println(
						"<!DOCTYPE html><body style=\"background-color: rgb(235, 236, 205); padding: 10px; text-align: center;\"><code><font size=\"3.5\"><table cellspacing=\"3\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 50%; height: 25%; border: 1px solid black\"");
				out.println("<tr style=\"border: 1px solid black\">");
				out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + "Reader ID"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "Reader Name"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "Borrowing Frequency");
				out.println("</tr>");
				while (resultSet.next()) {
					out.println("<tr style=\"border: 1px solid black\">");
					out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(1)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(2)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(3)
							+ "</td>");
					out.println("</tr>");
				}
				out.println("</table></font>");
				out.println("</code></body></html>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		if (req.getParameter("inadmin-submit-6") != null) {
			int n = Integer.parseInt(req.getParameter("n"));
			String query = "select b.rid, r.rname, count(*) from borrows b, reader r where b.rid = r.rid group by b.rid, r.rname order by count(*) desc limit "
					+ n;

			Statement statement = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			try {
				ResultSet resultSet = statement.executeQuery(query);
				out = res.getWriter();
				out.println(
						"<!DOCTYPE html><body style=\"background-color: rgb(235, 236, 205); padding: 10px; text-align: center;\"><code><font size=\"3.5\"><table cellspacing=\"3\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 50%; height: 25%; border: 1px solid black\"");
				out.println("<tr style=\"border: 1px solid black\">");
				out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + "Reader ID"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "Reader Name"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "Borrowing Frequency");
				out.println("</tr>");
				while (resultSet.next()) {
					out.println("<tr style=\"border: 1px solid black\">");
					out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(1)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(2)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(3)
							+ "</td>");
					out.println("</tr>");
				}
				out.println("</table></font>");
				out.println("</code></body></html>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		if (req.getParameter("inadmin-submit-7") != null) {
			int bid = Integer.parseInt(req.getParameter("bid"));
			int n = Integer.parseInt(req.getParameter("n"));

			String query = "select title from document as d inner join (select docid from borrows where bid=" + bid
					+ " group by docid order by count(*) desc limit " + n + ") as d2 on d.docid=d2.docid";

			Statement statement = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			try {
				ResultSet resultSet = statement.executeQuery(query);
				out = res.getWriter();
				out.println(
						"<!DOCTYPE html><body style=\"background-color: rgb(235, 236, 205); padding: 10px; text-align: center;\"><code><font size=\"3.5\"><table cellspacing=\"3\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 50%; height: 25%; border: 1px solid black\"");
				out.println("<tr style=\"border: 1px solid black\">");
				out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Document Titles</b></td>");
				out.println("</tr>");
				while (resultSet.next()) {
					out.println("<tr style=\"border: 1px solid black\">");
					out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(1)
							+ "</td>");
					out.println("</tr>");
				}
				out.println("</table></font>");
				out.println("</code></body></html>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		if (req.getParameter("inadmin-submit-8") != null) {
			int n = Integer.parseInt(req.getParameter("n"));

			String query = "select docid from borrows group by docid order by count(*) desc limit " + n;

			Statement statement = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			try {
				ResultSet resultSet = statement.executeQuery(query);
				out = res.getWriter();
				out.println(
						"<!DOCTYPE html><body style=\"background-color: rgb(235, 236, 205); padding: 10px; text-align: center;\"><code><font size=\"3.5\"><table cellspacing=\"3\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 50%; height: 25%; border: 1px solid black\"");
				out.println("<tr style=\"border: 1px solid black\">");
				out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Document ID's</b></td>");
				out.println("</tr>");
				while (resultSet.next()) {
					out.println("<tr style=\"border: 1px solid black\">");
					out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(1)
							+ "</td>");
					out.println("</tr>");
				}
				out.println("</table></font>");
				out.println("</code></body></html>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		if (req.getParameter("inadmin-submit-9") != null) {
			int year = Integer.parseInt(req.getParameter("year"));

			String query = "select title from document where docid in (select b1.docid from borrows b1,  borrowing b2 where b1.bor_no=b2.bor_no and  year(bdtime)="
					+ year + ") limit 10";

			Statement statement = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			try {
				ResultSet resultSet = statement.executeQuery(query);
				out = res.getWriter();
				out.println(
						"<!DOCTYPE html><body style=\"background-color: rgb(235, 236, 205); padding: 10px; text-align: center;\"><code><font size=\"3.5\"><table cellspacing=\"3\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 50%; height: 25%; border: 1px solid black\"");
				out.println("<tr style=\"border: 1px solid black\">");
				out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Document Titles</b></td>");
				out.println("</tr>");
				while (resultSet.next()) {
					out.println("<tr style=\"border: 1px solid black\">");
					out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(1)
							+ "</td>");
					out.println("</tr>");
				}
				out.println("</table></font>");
				out.println("</code></body></html>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		if (req.getParameter("inadmin-submit-10") != null) {
			String startDate = req.getParameter("start-date");
			String endDate = req.getParameter("end-date");

			String query1 = "select b1.bid, b3.lname,  DATEDIFF(CURDATE(),bdtime ) * 2 AS DateDiff from borrows b1, borrowing b2, branch b3 where b1.bid=b3.bid and  b1.bor_no=b2.bor_no and date(bdtime)>=\'"
					+ startDate + "\' and date(bdtime)<=\'" + endDate + "\'";

			String query2 = "drop view if exists t1";

			String query3 = "create view t1 as select b1.bid, b3.lname,  DATEDIFF(CURDATE(),bdtime ) - 20 * 0.2 AS DateDiff from borrows b1, borrowing b2, branch b3 where b1.bid=b3.bid and  b1.bor_no=b2.bor_no and date(bdtime)>=\'"
					+ startDate + "\' and date(bdtime)<=\'" + endDate + "\'";

			String query4 = "drop view if exists t2";

			String query5 = "create view t2 as select bid, count(*) as freq from borrows group by bid";

			String query6 = "drop view if exists t3";

			String query7 = "create view t3 as select bid, lname, sum(DateDiff) as DateDiff from t1 group by bid, lname";

			String query8 = "drop view if exists t4";

			String query9 = "create view t4 as select b3.bid, b3.lname, b3.DateDiff/b2.freq from t2 as b2, t3 as b3 where b2.bid=b3.bid";

			String query10 = "select * from t4";

			Statement statement = null;

			try {
				statement = (Statement) con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			try {
				ResultSet resultSet = statement.executeQuery(query1);
				statement.executeUpdate(query2);
				statement.executeUpdate(query3);
				statement.executeUpdate(query4);
				statement.executeUpdate(query5);
				statement.executeUpdate(query6);
				statement.executeUpdate(query7);
				statement.executeUpdate(query8);
				statement.executeUpdate(query9);
				resultSet = statement.executeQuery(query10);

				out = res.getWriter();
				out.println(
						"<!DOCTYPE html><body style=\"background-color: rgb(235, 236, 205); padding: 10px; text-align: center;\"><code><font size=\"3.5\"><table cellspacing=\"3\" style=\"position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 50%; height: 25%; border: 1px solid black\"");
				out.println("<tr style=\"border: 1px solid black\">");
				out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Branch ID</b>"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Branch Name</b>"
						+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "<b>Average Fine</b>");
				out.println("</tr>");
				while (resultSet.next()) {
					out.println("<tr style=\"border: 1px solid black\">");
					out.println("<td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(1)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + resultSet.getString(2)
							+ "</td><td style=\"border: 1px solid black; padding: 15px;\">" + "$"
							+ resultSet.getString(3) + "</td>");
					out.println("</tr>");
				}
				out.println("</table></font>");
				out.println("</code></body></html>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		if (req.getParameter("reader-action-submit") != null) {
			System.out.println("Quit Selected!");

			ServletContext sc = getServletContext();

			sc.getRequestDispatcher("/Main.html").forward(req, res);
		}

		if (req.getParameter("admin-action-submit") != null) {
			System.out.println("Quit Selected!");

			ServletContext sc = getServletContext();

			sc.getRequestDispatcher("/Main.html").forward(req, res);
		}

		if (req.getParameter("quit-action-submit") != null) {
			out.println("<html><body><center><h1>Have a Nice Day!</h1></center></body></html>");
		}

	}

	public static void reserveDocument(HttpServletRequest req, HttpServletResponse res, Connection con,
			String reader_id, String reader_name, String reader_address, String reader_phone, String reader_doc)
			throws IOException {
		System.out.println("In reader2");
		ResultSet resultSet = null;
		Statement statement = null;
		PrintWriter out = res.getWriter();
		try {
			statement = (Statement) con.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

//		String reader_id = req.getParameter("reader-id-reserve");
//		String reader_name = req.getParameter("reader-name-reserve");
//		String reader_address = req.getParameter("reader-address-reserve");
//		String reader_phone = req.getParameter("reader-phone-reserve");
//		String reader_doc = req.getParameter("reader-doc-reserve");
		String checkout_query = "";

		if (!reader_id.equals("")) {
			checkout_query = "select * from reader where rid=" + reader_id;
		} else if (!reader_name.equals("")) {
			checkout_query = "select * from reader where rname=\'" + reader_name + "\'";
		} else if (!reader_address.equals("")) {
			checkout_query = "select * from reader where raddress=\'" + reader_address + "\'";
		} else if (!reader_phone.equals("")) {
			checkout_query = "select * from reader where phone_no=\'" + reader_phone + "\'";
		}
		System.out.println(checkout_query);
		try {
			resultSet = statement.executeQuery(checkout_query);
			System.out.println("Reader exists!");
			if (resultSet != null) {
				resultSet.next();
				reader_id = resultSet.getString(1);
				checkout_query = "select * from copy where docid=" + reader_doc;
				resultSet = statement.executeQuery(checkout_query);

				if (resultSet.next()) {
					resultSet.next();
					int docid = Integer.parseInt(resultSet.getString(1));
					int copyno = Integer.parseInt(resultSet.getString(2));
					int bid = Integer.parseInt(resultSet.getString(3));

					checkout_query = "select * from reservation";

					ResultSet resultSetForLength = null;

					synchronized (statement) {
						resultSetForLength = statement.executeQuery(checkout_query);

					}
					int borno = 0;
					while (resultSetForLength.next()) {
						borno = Math.max(borno, Integer.parseInt(resultSetForLength.getString(1)));
						System.out.println("Reservation : " + borno);
					}
					borno = borno + 1;

					// code here for conditions
					checkout_query = "select docid, copyno, bid from copy where (docid,copyno,bid) not in (select docid, copyno, bid from reserves where docid="
							+ reader_doc + ") and docid=" + reader_doc + "";
					System.out.println(checkout_query);
					resultSet = statement.executeQuery(checkout_query);
					int flag = 0;
					if (resultSet.next()) {
						docid = Integer.parseInt(resultSet.getString(1));
						copyno = Integer.parseInt(resultSet.getString(2));
						bid = Integer.parseInt(resultSet.getString(3));
						System.out.println("Hello flag 0");
						flag = 1;
					}

					Date date = new Date();
					Timestamp ts = new Timestamp(date.getTime());

					if (flag == 1) {
						System.out.println("Hello flag 1");

						checkout_query = "insert into reservation values(" + borno + ",\'" + ts + "\')";
						statement.executeUpdate(checkout_query);

						checkout_query = "insert into reserves values(" + Integer.parseInt(reader_id) + "," + borno
								+ ", " + docid + ", " + copyno + ", " + bid + ")";
						System.out.println(checkout_query);
						try {
							statement.executeUpdate(checkout_query);
							out.println(
									"<html><body><center><h1>Document successfully reserved!</h1></center></body></html>");
						} catch (Exception e) {
							out.println(
									"<html><body><center><h1>Trigger Invoked! Reader trying to checkout more than 10 documents...</h1></center></body></html>");
						}
					} else {

						out.println(
								"<html><body><center><h1>Document copy not available for reservation!</h1></center></body></html>");
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static HashMap<String, Integer> checkCopy(Connection con, Statement statement, int copyno, int bid,
			int docid, int rid) throws SQLException {
		HashMap<String, Integer> map = null;

		String query = "select * from copy where copyno=" + copyno + " and bid=" + bid;
		ResultSet resultSet = statement.executeQuery(query);
		if (resultSet.next()) {
			map = new HashMap<String, Integer>();
			map.put("copyno", Integer.parseInt(resultSet.getString(2)));
			map.put("bid", Integer.parseInt(resultSet.getString(3)));
			map.put("docid", docid);
			map.put("rid", rid);
		}
		return map;
	}

	public static boolean checkBorrows(Connection con, Statement statement, int copyno, int bid, int docid, int rid)
			throws SQLException {
		String query = "select * from borrows where copyno=" + copyno + " and bid=" + bid + " and docid=" + docid
				+ " and rid=" + rid + "";
		ResultSet resultSet = statement.executeQuery(query);
		if (resultSet != null) {
			return true;
		}

		return false;
	}
}
