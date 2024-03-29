package microservices.postmicroservice.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.List;

@Data
@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class League implements Serializable {


    @Id
    @SequenceGenerator(name="LEAGUE_ID_GENERATOR", sequenceName="LEAGUE_SEQ", allocationSize = 1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="LEAGUE_ID_GENERATOR")
    private Long id;

    @NotBlank(message = "Team name can not be blank.")
    @Column
    private String leagueName;

    @Column
    private String label;

    @OneToMany(mappedBy = "league")
    @JsonIgnore
    private List<Team> teams;

}
