package sit.int202.officemanagement.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sit.int202.officemanagement.entities.Office;
import sit.int202.officemanagement.repositories.OfficeRepository;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet(name = "OfficeUpdateServlet", value = "/093/office-management")
public class OfficeFindRemoveServlet extends HttpServlet {
    private OfficeRepository officeRepository;
    @Override
    public void init() throws ServletException {
        officeRepository = new OfficeRepository();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        officeRepository.clearEntityManagerCache();

        List<Office> officeList = officeRepository.findAll();
        Set<String> uniqueSetCountry = new HashSet<>();
        Set<String> uniqueSetCity = new HashSet<>();
        if (officeList != null && !officeList.isEmpty()){
            for (Office office: officeList) {
                uniqueSetCountry.add(office.getCountry());
                uniqueSetCity.add(office.getCity());
            }
        }
        request.setAttribute("uniqueCountry",uniqueSetCountry);
        request.setAttribute("uniqueCity",uniqueSetCity);
        request.setAttribute("officeList",officeList);
        String findVal = request.getParameter("officeList");
        if (findVal != null){
            if(!findVal.equals("all")){
                List<Office> offices = officeRepository.findByCityOrCountry(findVal);
                request.setAttribute("offices",offices);
            }else {
                request.setAttribute("offices", officeList);
            }
        }else {
            request.setAttribute("offices", officeList);
        }
        request.getRequestDispatcher("/office-management.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleDelete(request,response);
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String officeCode = request.getParameter("removeOffice") == null? request.getParameter("officeRemoveCode"): request.getParameter("removeOffice");
        String message;
        if (officeCode != null){
            Office office = officeRepository.find(officeCode);
            if (office != null) {
                if (officeRepository.delete(office)) {
                    message = "Remove Office Succesfully";
                } else {
                    message = "Failed To Remove Office";
                }
            }else {
                message = "Office Not Found";
            }
        }else {
            message = "Invalid Input";

        }
        request.getSession().setAttribute("statusMsg", message);
        response.sendRedirect(request.getContextPath() + "/093/office-management?officeList=all");
    }
}
 
