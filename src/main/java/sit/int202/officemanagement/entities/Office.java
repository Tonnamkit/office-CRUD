package sit.int202.officemanagement.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;


@Entity
@Table(name = "Offices")
@Getter
@Setter
@ToString
@NamedQueries({
        @NamedQuery(name = "OFFICE.FIND_ALL", query = "SELECT o FROM Office o"),
        @NamedQuery(name = "OFFICE.FIND_BY_COUNTRY", query = "SELECT o FROM Office o WHERE o.country LIKE :countryParam"),
        @NamedQuery(name = "OFFICE.FIND_BY_CITY_OR_COUNTRY",
                query = "SELECT o FROM Office o WHERE lower(o.city) LIKE :city OR lower(o.country) LIKE :country")
}
)
public class Office {
    @Id
    private String officeCode;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private String country;
    private String postalCode;
    private String phone;
    private String territory;
    @OneToMany (mappedBy = "office")
    private List<Employee> employeeList;
}
