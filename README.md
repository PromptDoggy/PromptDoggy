# PromptDoggy
Prompt management tool for product and engineering teams.

## Archive Notice
After two weeks of intensive discussions and iterations, we have decided to pivot towards developing a BI tool. As a result, we are temporarily halting development on PromptDoggy.

## Live Demo
### [Management Console](https://demo.promptdoggy.com/login)
* Email: demo@promptdoggy.com
* Password: password123

### API
1. Copy the API key from the [settings page](https://demo.promptdoggy.com/settings).
2. Include it as a header in the Bearer token format in the request header.
3. Access the API using the following endpoints:
   * Prompt list: `GET /api/v1/projects/:project_token/environments/:environment_token/prompts`
     * `is_deployed`: Retrieve only deployed prompts
     * `is_static`: Retrieve only static prompts
   * Get prompt content: `GET /api/v1/projects/:project_token/environments/:environment_token/prompts/:prompt_name`


## Features
### Current features
- **Prompt Management Dashboard for Product Managers:** Product managers can write prompts and deploy them to different environments, such as development or production.
- **APIs for Engineers to Fetch Prompts:** Engineers can retrieve prompts by name through the API.
- **Copilot Textarea:** Inspired by GitHub Copilot, we implemented a similar experience to see if it could benefit product managers.
- **Static Prompts:** For prompts that don’t change often, such as system prompts, you can mark them as static. This allows filtering in the API and caching during the CI process.
- **Encryption:** All prompts are encrypted in the database. We believe prompts are a vital secret for any LLM app, with PMs and engineers spending countless hours tweaking and testing them. We want to ensure they are secure and inaccessible to others.

#### Planned features
- [ ] Role based prompt management
- [ ] Project, environment, prompt deletion

### Questions to be explored
These are the questions I'm exploring and trying to answer with PromptDoggy:
- How does PromptDoggy manage its own prompts?
- How can we design better prompts with fewer iterations?
- How do we compare prompts and find the best one for a specific task?
- How do we decide which LLM is the best for a specific task?
- How do we collect LLM-generated data and use it to fine-tune the LLM model?

## Install and run locally
### Prerequisites
* Ruby 3.2.2+
* PostgreSQL
* Azure OpenAI

### Installation
* Clone the repository: `git clone git@github.com:PromptDoggy/PromptDoggy.git`
* Install dependencies: `bundle install`
* Migrate the database: `rails db:migrate`

### Run locally
* copy `.env.example` to `.env.development.local`
* Run `rails db:encryption:init` to [create the encryption key](https://guides.rubyonrails.org/active_record_encryption.html) for environment variables starting with `ACTIVE_RECORD_ENCRYPTION`
* Prepare AWS and Azure service keys, and fill in the environment variables
* Start the server: `bin/dev`

## Note
⚠️This project is still in early and rapid development.
Features will be iterated quickly or may even be deprecated based on community feedback.

## Contact
* Email: zhenhangtung@gmail.com