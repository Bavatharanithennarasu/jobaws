
package com.example.easyhirepro.repository;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.jpa.repository.Modifying;

import com.example.easyhirepro.entity.JobApplication;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JobApplicationRepository extends JpaRepository<JobApplication, Long> {
	 List<JobApplication> findByUserId(Long userId);

@Modifying
@Transactional
void deleteByJobId(Long jobId);


}
