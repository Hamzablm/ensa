package com.ensa.productmanager.dao;

import com.ensa.productmanager.domain.LegacyPrice;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LegacyPriceRepository extends CrudRepository<LegacyPrice, Long> {

}
