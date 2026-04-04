CREATE DATABASE lt03k17;
USE lt03k17;

CREATE TABLE taxonomy(
	ncbi_id INT PRIMARY KEY AUTO_INCREMENT,
    species VARCHAR(100) NOT NULL,
    tax_string MEDIUMTEXT,
    tree_display_name VARCHAR(100),
    align_display_name VARCHAR(50)
);

CREATE TABLE rfamseq(
	rfamseq_acc VARCHAR(20) PRIMARY KEY,
    accession VARCHAR(15) NOT NULL,
    version INT(6) NOT NULL,
    ncbi_id INT(10) NOT NULL,
    mol_type ENUM('1', '2') NOT NULL,
    length INT(10),
    description VARCHAR(250) NOT NULL,
    previous_acc MEDIUMTEXT,
    source CHAR(20) NOT NULL,
    FOREIGN KEY (ncbi_id) REFERENCES taxonomy(ncbi_id)
);

CREATE TABLE family(
	rfam_acc VARCHAR(7) PRIMARY KEY,
    rfam_id VARCHAR(40) NOT NULL,
    auto_wiki INT(10) NOT NULL,
    description VARCHAR(75),
    author TINYTEXT,
    seed_source TINYTEXT,
    gathering_cutoff DECIMAL(5, 2),
    trusted_cutoff DeCIMAL(5, 2),
    noise_cuttoff DECIMAL(5, 2),
    comment LONGTEXT,
    previous_id TINYTEXT,
    cmbuild TINYTEXT,
    cmcalibrate TINYTEXT,
    cmsearch TINYTEXT,
    num_seed BIGINT(20),
    num_full BIGINT(20),
    num_genome_seq BIGINT(20),
    num_refseq BIGINT(20),
    type VARCHAR(50),
    structure_source TINYTEXT,
    number_of_species BIGINT(20),
    number_3d_structures INT,
    tax_seed MEDIUMTEXT,
    ecmli_lambda DOUBLE(10, 5),
    ecmli_mu DOUBLE(10, 5),
    ecmli_cal_db MEDIUMINT,
    ecmli_cal_hits MEDIUMINT,
    maxl MEDIUMINT,
    clen MEDIUMINT,
    match_pair_node BOOLEAN,
    hmm_tau DOUBLE(10, 5),
    hmm_lambda DOUBLE(10, 5),
    created DATETIME NOT NULL,
    updated TIMESTAMP NOT NULL
);

CREATE TABLE clan(
	clan_acc VARCHAR(7) PRIMARY KEY,
    id VARCHAR(40),
    previous_id TINYTEXT,
    description VARCHAR(100),
    author TINYTEXT
);

CREATE TABLE clan_membership(
	clan_acc VARCHAR(7) NOT NULL,
    rfam_acc VARCHAR(7) NOT NULL,
    FOREIGN KEY (clan_acc) REFERENCES clan(clan_acc),
    FOREIGN KEY (rfam_acc) REFERENCES family(rfam_acc)
);


CREATE TABLE full_region(
	rfam_acc VARCHAR(7) NOT NULL,
    rfamseq_acc VARCHAR(20) NOT NULL,
    seq_start BIGINT(19) NOT NULL,
    seq_end BIGINT(19) NOT NULL,
    bit_score DOUBLE(7, 2) NOT NULL,
    evalue_score VARCHAR(15) NOT NULL,
    cm_start MEDIUMINT(8) NOT NULL,
    cm_end MEDIUMINT(8) NOT NULL,
    truncated ENUM('1', '2') NOT NULL,
    type ENUM('seed', 'full') NOT NULL,
    is_signficant TINYINT(1) NOT NULL,
    FOREIGN KEY (rfam_acc) REFERENCES family(rfam_acc),
    FOREIGN KEY (rfamseq_acc) REFERENCES rfamseq(rfamseq_acc)
);