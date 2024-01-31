package lk.mobitel.abcbank.service.custom;

import lk.mobitel.abcbank.dto.CustomerDTO;
import lk.mobitel.abcbank.service.SuperService;

import java.util.List;

public interface CustomerService extends SuperService {
    CustomerDTO saveCustomer(CustomerDTO customer);
    void updateCustomer(CustomerDTO customer);
    void deleteCustomer(String nic);
    CustomerDTO getCustomerDetails(String nic);
    List<CustomerDTO> getAllCustomers();
}
