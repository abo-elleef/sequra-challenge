# README
the document show 
- needed versions and system depnedecies of programming languages and frameworks 
- steps to configure db development/ locally 
- steps to run the application locally
- API sample calls

# Ruby version
  - 2.7.3
# Rails version
  - 7.0.2.2
# Database Setup
- rake db:create
- rake db:migrate
- rake db:seed
# Run Locally
- ./bin/dev
# Test Suite
No Tests added for the time limitation 

If I had enough time I would add 
- Model 
- Job tests
- API (integration test)
# What are leftover(s)
- Add a cron job to schedule `CalculateMerchantsSisbursementsJob` every week
- handle different cases to background job
  - handle the cases of Job failure due to memory shortage or termination signal
  - let the job when last run happened and which orders have been considered (just in case that the job were down for more than one week)
- Test suite
    - Add Model tests / validation tests
    - add job tests 
    - add integration tests
- Document that API in swagger 

# API cases

you can check the response directly from browser or use postman 
(I used postman to test the API responses)

- `/api/v1/disbursements.json`
- `/api/v1/disbursements.json?date=2018-4-1`
- `/api/v1/disbursements.json?date=2018-4-1&merchant_id=4`

