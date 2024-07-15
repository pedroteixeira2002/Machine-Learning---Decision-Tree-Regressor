% Define facts about the factors affecting salary

% Experience level facts
experience_level('SE').
experience_level('EN').
experience_level('MI').
experience_level('EX').

% Company size facts
company_size(small).
company_size(medium).
company_size(large).

% Job title facts
job_title('Machine Learning Engineer').
job_title('Data Scientist').
job_title('Data Engineer').
job_title('Data Analyst').

% Employment type facts
employment_type('FT').
employment_type('PT').
employment_type('FL').
employment_type('CT').

% Define a rule to predict salary based on factors
predict_salary(ExperienceLevel, CompanySize, JobTitle, RemoteRatio, EmploymentType, PredictedSalary) :-
    % Decision tree rules for adjustments based on provided structure
    (   experience_level(ExperienceLevel),
        company_size(CompanySize),
        job_title(JobTitle),
        employment_type(EmploymentType)
    ->  % Valid combination of factors, calculate PredictedSalary
        (   ExperienceLevel = 'SE' ->
            (   CompanySize = small ->
                (   JobTitle = 'Machine Learning Engineer' ->
                    (   RemoteRatio =< 25.0 ->
                            (   EmploymentType = 'PT' -> PredictedSalary is 36011.5
                            ;   true -> PredictedSalary is 48007.0
                            )
                    ;   RemoteRatio > 25.0 ->
                            (   JobTitle = 'Data Engineer' -> PredictedSalary is 45390.0
                            ;   EmploymentType = 'PT' -> PredictedSalary is 40885.5
                            ;   true -> PredictedSalary is 45390.0
                            )
                    )
                ;   JobTitle = 'Data Scientist' ->
                    (   RemoteRatio =< 25.0 ->
                            (   EmploymentType = 'PT' -> PredictedSalary is 91000.0
                            ;   true -> PredictedSalary is 36011.5
                            )
                    ;   RemoteRatio > 25.0 ->
                            (   EmploymentType = 'PT' -> PredictedSalary is 40885.5
                            ;   true -> PredictedSalary is 40885.5
                            )
                    )
                )
            ;   CompanySize = medium ->
                (   RemoteRatio =< 25.0 ->
                        (   JobTitle = 'Machine Learning Engineer' ->
                            (   EmploymentType = 'PT' -> PredictedSalary is 82000.0
                            ;   true -> PredictedSalary is 82000.0
                            )
                        ;   JobTitle = 'Data Scientist' ->
                            (   EmploymentType = 'PT' -> PredictedSalary is 91000.0
                            ;   true -> PredictedSalary is 82000.0
                            )
                        ;   true -> PredictedSalary is 82000.0
                        )
                ;   RemoteRatio > 25.0 ->
                        (   JobTitle = 'Data Scientist' ->
                            (   EmploymentType = 'PT' -> PredictedSalary is 40885.5
                            ;   true -> PredictedSalary is 48125.0
                            )
                        ;   true -> PredictedSalary is 48125.0
                        )
                )
            ;   CompanySize = large ->
                (   JobTitle = 'Machine Learning Engineer' ->
                    (   RemoteRatio =< 25.0 ->
                            (   EmploymentType = 'PT' -> PredictedSalary is 52398.4
                            ;   true -> PredictedSalary is 65000.0
                            )
                    ;   RemoteRatio > 25.0 ->
                            (   EmploymentType = 'PT' -> PredictedSalary is 40885.5
                            ;   true -> PredictedSalary is 65000.0
                            )
                    )
                ;   JobTitle = 'Data Scientist' ->
                    (   EmploymentType = 'PT' -> PredictedSalary is 48125.0
                    ;   true -> PredictedSalary is 48125.0
                    )
                ;   true -> PredictedSalary is 65000.0
                )
            )
        ;   ExperienceLevel = 'EN' ->
            (   RemoteRatio =< 25.0 ->
                    (   JobTitle = 'Machine Learning Engineer' ->
                            (   EmploymentType = 'PT' -> PredictedSalary is 91000.0
                            ;   true -> PredictedSalary is 83000.0
                            )
                    ;   JobTitle = 'Data Scientist' ->
                            (   EmploymentType = 'PT' -> PredictedSalary is 91000.0
                            ;   true -> PredictedSalary is 83000.0
                            )
                    ;   true -> PredictedSalary is 83000.0
                    )
            ;   RemoteRatio > 25.0 ->
                    (   JobTitle = 'Data Scientist' ->
                            (   EmploymentType = 'PT' -> PredictedSalary is 97500.0
                            ;   true -> PredictedSalary is 97500.0
                            )
                    ;   true -> PredictedSalary is 97500.0
                    )
            )
        ;   ExperienceLevel = 'MI' ->
            (   CompanySize = small ->
                    (   RemoteRatio =< 25.0 ->
                            (   JobTitle = 'Machine Learning Engineer' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 94000.0
                                ;   true -> PredictedSalary is 58000.0
                                )
                            ;   JobTitle = 'Data Scientist' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 94000.0
                                ;   true -> PredictedSalary is 58000.0
                                )
                            ;   true -> PredictedSalary is 58000.0
                            )
                    ;   RemoteRatio > 25.0 ->
                            (   JobTitle = 'Data Engineer' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 122001.76923076923
                                ;   true -> PredictedSalary is 58000.0
                                )
                            ;   JobTitle = 'Data Scientist' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 94000.0
                                ;   true -> PredictedSalary is 58000.0
                                )
                            ;   true -> PredictedSalary is 58000.0
                            )
                    )
            ;   CompanySize = medium ->
                    (   RemoteRatio =< 25.0 ->
                            (   JobTitle = 'Machine Learning Engineer' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 82000.0
                                ;   true -> PredictedSalary is 65844.0
                                )
                            ;   JobTitle = 'Data Scientist' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 91000.0
                                ;   true -> PredictedSalary is 65844.0
                                )
                            ;   true -> PredictedSalary is 65844.0
                            )
                    ;   RemoteRatio > 25.0 ->
                            (   JobTitle = 'Data Engineer' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 122001.76923076923
                                ;   true -> PredictedSalary is 65844.0
                                )
                            ;   JobTitle = 'Data Scientist' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 91000.0
                                ;   true -> PredictedSalary is 65844.0
                                )
                            ;   true -> PredictedSalary is 65844.0
                            )
                    )
            ;   CompanySize = large ->
                    (   RemoteRatio =< 25.0 ->
                            (   JobTitle = 'Machine Learning Engineer' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 52398.4
                                ;   true -> PredictedSalary is 65000.0
                                )
                            ;   JobTitle = 'Data Scientist' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 48125.0
                                ;   true -> PredictedSalary is 65000.0
                                )
                            ;   true -> PredictedSalary is 65000.0
                            )
                    ;   RemoteRatio > 25.0 ->
                            (   JobTitle = 'Data Engineer' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 52398.4
                                ;   true -> PredictedSalary is 65000.0
                                )
                            ;   JobTitle = 'Data Scientist' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 48125.0
                                ;   true -> PredictedSalary is 65000.0
                                )
                            ;   true -> PredictedSalary is 65000.0
                            )
                    )
            )
        ;   ExperienceLevel = 'EX' ->
            (   CompanySize = small ->
                    (   RemoteRatio =< 25.0 ->
                            (   JobTitle = 'Machine Learning Engineer' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 94000.0
                                ;   true -> PredictedSalary is 207440.0
                                )
                            ;   JobTitle = 'Data Scientist' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 94000.0
                                ;   true -> PredictedSalary is 207440.0
                                )
                            ;   true -> PredictedSalary is 207440.0
                            )
                    ;   RemoteRatio > 25.0 ->
                            (   JobTitle = 'Data Engineer' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 94000.0
                                ;   true -> PredictedSalary is 207440.0
                                )
                            ;   JobTitle = 'Data Scientist' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 94000.0
                                ;   true -> PredictedSalary is 207440.0
                                )
                            ;   true -> PredictedSalary is 207440.0
                            )
                    )
            ;   CompanySize = medium ->
                    (   RemoteRatio =< 25.0 ->
                            (   JobTitle = 'Machine Learning Engineer' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 82000.0
                                ;   true -> PredictedSalary is 33511.0
                                )
                            ;   JobTitle = 'Data Scientist' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 91000.0
                                ;   true -> PredictedSalary is 33511.0
                                )
                            ;   true -> PredictedSalary is 33511.0
                            )
                    ;   RemoteRatio > 25.0 ->
                            (   JobTitle = 'Data Engineer' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 82000.0
                                ;   true -> PredictedSalary is 33511.0
                                )
                            ;   JobTitle = 'Data Scientist' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 91000.0
                                ;   true -> PredictedSalary is 33511.0
                                )
                            ;   true -> PredictedSalary is 33511.0
                            )
                    )
            ;   CompanySize = large ->
                    (   RemoteRatio =< 25.0 ->
                            (   JobTitle = 'Machine Learning Engineer' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 52398.4
                                ;   true -> PredictedSalary is 110000.0
                                )
                            ;   JobTitle = 'Data Scientist' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 48125.0
                                ;   true -> PredictedSalary is 110000.0
                                )
                            ;   true -> PredictedSalary is 110000.0
                            )
                    ;   RemoteRatio > 25.0 ->
                            (   JobTitle = 'Data Engineer' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 52398.4
                                ;   true -> PredictedSalary is 110000.0
                                )
                            ;   JobTitle = 'Data Scientist' ->
                                (   EmploymentType = 'PT' -> PredictedSalary is 48125.0
                                ;   true -> PredictedSalary is 110000.0
                                )
                            ;   true -> PredictedSalary is 110000.0
                            )
                    )
            )
        )
    ;   % Invalid combination of factors
        PredictedSalary is 0  % Default salary if factors are not valid
    ).