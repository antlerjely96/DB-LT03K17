CREATE DATABASE lt03k17;
USE lt03k17;

CREATE TABLE taxonomy(
	ncbi_id INT,
    species VARCHAR(100),
    tax_string MEDIUMTEXT,
    tree_display_name VARCHAR(100),
    align_display_name VARCHAR(50)
);

CREATE TABLE rfamseq(
	rfamseq_acc VARCHAR(20),
    accession VARCHAR(15),
    version INT(6),
    ncbi_id INT(10),
    mol_type ENUM('1', '2'),
    length INT(10),
    description VARCHAR(250),
    previous_acc MEDIUMTEXT,
    source CHAR(20)
);

CREATE TABLE family(
	rfam_acc VARCHAR(7),
    rfam_id VARCHAR(40),
    auto_wiki INT(10),
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
    created DATETIME,
    updated TIMESTAMP
);

CREATE TABLE clan_membership(
	clan_acc VARCHAR(7),
    rfam_acc VARCHAR(7)
);

CREATE TABLE clan(
	clan_acc VARCHAR(7),
    id VARCHAR(40),
    previous_id TINYTEXT,
    description VARCHAR(100),
    author TINYTEXT
);

CREATE TABLE full_region(
	rfam_acc VARCHAR(7),
    rfamseq_acc VARCHAR(20),
    seq_start BIGINT(19),
    seq_end BIGINT(19),
    bit_score DOUBLE(7, 2),
    evalue_score VARCHAR(15),
    cm_start MEDIUMINT(8),
    cm_end MEDIUMINT(8),
    truncated ENUM('1', '2'),
    type ENUM('seed', 'full'),
    is_signficant TINYINT(1)
);