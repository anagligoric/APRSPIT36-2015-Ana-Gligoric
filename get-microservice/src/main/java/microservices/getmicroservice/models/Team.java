package microservices.getmicroservice.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Team implements Serializable {

    @Id
    private Long id;

    @NotBlank(message = "Team name can not be blank.")
    @Column
    private String teamName;

    @Temporal(TemporalType.DATE)
    private Date founded;

    @NotBlank(message = "Team headquarter can not be blank.")
    @Column
    private String headquarter;

    @OneToMany(mappedBy = "team")
    @JsonIgnore
    private List<Player> players;

    @ManyToOne
    @JoinColumn
    private League league;
}
