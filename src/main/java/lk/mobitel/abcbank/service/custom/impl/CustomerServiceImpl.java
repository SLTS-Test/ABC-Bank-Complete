package lk.mobitel.abcbank.service.custom.impl;


import lk.mobitel.abcbank.dto.CustomerDTO;
import lk.mobitel.abcbank.entity.Customer;
import lk.mobitel.abcbank.exception.AddException;
import lk.mobitel.abcbank.repository.CustomerRepository;
import lk.mobitel.abcbank.service.custom.CustomerService;
import lk.mobitel.abcbank.service.util.Transformer;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

    private final CustomerRepository customerRepository;
    private final Transformer transformer;

    public CustomerServiceImpl(CustomerRepository customerRepository, Transformer transformer) {
        this.customerRepository = customerRepository;
        this.transformer = transformer;
    }

    @Override
    public CustomerDTO saveCustomer(CustomerDTO customerDTO) {
        Customer customer = transformer.fromCustomerDTO(customerDTO);
        customerRepository.save(customer);
        return customerDTO;
    }

    @Override
    public void updateCustomer(CustomerDTO customerDTO) {
        customerRepository.findById(customerDTO.getNic()).orElseThrow(() -> new AddException(404, "No user associated with the nic"));

        Customer newCustomer = transformer.fromCustomerDTO(customerDTO);
        customerRepository.save(newCustomer);
    }

    @Override
    public void deleteCustomer(String nic) {
        if(!customerRepository.existsById(nic)) throw new AddException(404, "No Customer Found");

        customerRepository.deleteById(nic);
    }

    @Override
    public CustomerDTO getCustomerDetails(String nic) {
        Optional<Customer> optCustomer = customerRepository.findById(nic);
        System.out.println(optCustomer.isEmpty());
        if(optCustomer.isEmpty()) throw new AddException(404, "No Customer Found");
        return transformer.toCustomerDTO(optCustomer.get());
    }

    @Override
    public List<CustomerDTO> getAllCustomers() {
        List<Customer> customerList;
        customerList = customerRepository.findAll();
        return customerList.stream().map(transformer::toCustomerDTO).collect(Collectors.toList());
    }
}
