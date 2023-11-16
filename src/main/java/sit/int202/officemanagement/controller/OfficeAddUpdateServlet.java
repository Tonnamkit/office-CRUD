package sit.int202.officemanagement.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sit.int202.officemanagement.entities.Office;
import sit.int202.officemanagement.repositories.OfficeRepository;

import java.io.IOException;

import static sit.int202.officemanagement.util.Utill.isNullOrEmpty;

@WebServlet(name = "OfficeAddUpdateServlet", value = "/093/office-form")
public class OfficeAddUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OfficeRepository officeRepository = new OfficeRepository();
        String add = request.getParameter("insert");
        String editOfficeCode = request.getParameter("editOffice");
        if (add != null){
            request.setAttribute("add", add);
        }else {
            request.getSession().setAttribute("editOffice",editOfficeCode);
            Office updateOffice = officeRepository.find(editOfficeCode);
            request.setAttribute("updateOffice",updateOffice);
        }
        officeRepository.close();
        request.getRequestDispatcher("/office-form.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String editOffice = (String) request.getSession().getAttribute("editOffice");
        if ("add".equals(action)) {
            handleAdd(request, response);
        } else if ("update".equals(action)) {
            handleUpdate(request,response,editOffice);
        }
    }

    private void handleUpdate(HttpServletRequest request, HttpServletResponse response,String editOfficeCode) throws ServletException, IOException {
        OfficeRepository officeRepository = new OfficeRepository();
        Office updateOffice = officeRepository.find(editOfficeCode);
        String message;
        if (updateOffice != null) {
            if (isNullOrEmpty(request.getParameter("city")) ||
                    isNullOrEmpty(request.getParameter("phone")) || isNullOrEmpty(request.getParameter("addressLine1")) ||
                    isNullOrEmpty(request.getParameter("country")) || isNullOrEmpty(request.getParameter("postalCode")) ||
                    isNullOrEmpty(request.getParameter("territory"))) {
                message = "Invalid Input";
            } else {
                updateOffice.setOfficeCode(editOfficeCode);
                updateOffice.setCity(request.getParameter("city"));
                updateOffice.setPhone(request.getParameter("phone"));
                updateOffice.setAddressLine1(request.getParameter("addressLine1"));
                updateOffice.setAddressLine2(request.getParameter("addressLine2"));
                updateOffice.setState(request.getParameter("state"));
                updateOffice.setCountry(request.getParameter("country"));
                updateOffice.setPostalCode(request.getParameter("postalCode"));
                updateOffice.setTerritory(request.getParameter("territory"));
                if (officeRepository.update(updateOffice)) {
                    message = "Update Office Successfully";
                    request.getSession().setAttribute("statusMsg", message);
                    response.sendRedirect(request.getContextPath() + "/093/office-management?officeList=all");
                    return;
                } else {
                    message = "Fail To Update";
                }
            }
        } else {
            message = "Office Not Found";
        }
        officeRepository.close();
        request.setAttribute("addStatus", message);
        request.getRequestDispatcher("/office-form.jsp").forward(request, response);
    }

    private void handleAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OfficeRepository officeRepository = new OfficeRepository();
        request.setAttribute("add","add");
        String officeCode = request.getParameter("officeCode");
        String message;

        if (isNullOrEmpty(officeCode) || isNullOrEmpty(request.getParameter("city")) ||
                isNullOrEmpty(request.getParameter("phone")) || isNullOrEmpty(request.getParameter("addressLine1")) ||
                isNullOrEmpty(request.getParameter("country")) || isNullOrEmpty(request.getParameter("postalCode")) ||
                isNullOrEmpty(request.getParameter("territory"))) {
            message = "Missing Input";
        } else {
            Office newOffice = createOfficeFromRequest(request);

            if (officeRepository.insert(newOffice)) {
                message = "Add Successfully";
                request.getSession().setAttribute("statusMsg", message);
                response.sendRedirect(request.getContextPath()+ "/093/office-management?officeList=all");
                return;
            } else {
                message = "Fail to Add Office";
            }
        }
        officeRepository.close();
        request.setAttribute("addStatus", message);
        request.getRequestDispatcher("/office-form.jsp").forward(request, response);
    }


    private Office createOfficeFromRequest(HttpServletRequest request) {
        Office newOffice = new Office();
        newOffice.setOfficeCode(request.getParameter("officeCode"));
        newOffice.setCity(request.getParameter("city"));
        newOffice.setPhone(request.getParameter("phone"));
        newOffice.setAddressLine1(request.getParameter("addressLine1"));
        newOffice.setAddressLine2(request.getParameter("addressLine2"));
        newOffice.setState(request.getParameter("state"));
        newOffice.setCountry(request.getParameter("country"));
        newOffice.setPostalCode(request.getParameter("postalCode"));
        newOffice.setTerritory(request.getParameter("territory"));
        return newOffice;
    }
}
 
