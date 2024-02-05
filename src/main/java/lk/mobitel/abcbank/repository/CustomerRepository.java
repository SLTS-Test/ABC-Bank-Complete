package lk.mobitel.abcbank.repository;

import lk.mobitel.abcbank.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


public interface CustomerRepository extends JpaRepository<Customer, String> {
}
