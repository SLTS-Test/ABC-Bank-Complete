package lk.mobitel.abcbank.repository;

import lk.mobitel.abcbank.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, String> {
}
