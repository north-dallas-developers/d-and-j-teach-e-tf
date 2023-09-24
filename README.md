# David and Justin Teach Eric Terraform

## The Prep

Before attending this presentation, please ensure that you have the following tools installed on your machine:

- **Git**: You can download and install Git from the official website: [Git Downloads](https://git-scm.com/downloads).

- **Terraform**: To install Terraform we recommend using [tfenv](https://github.com/tfutils/tfenv) or follow the instructions provided here: [Terraform Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli).

- **AWS Account**: Most everything we do will on the free tier, create an [AWS Account](https://aws.amazon.com/resources/create-account/) if you do not already have one.

- **AWS CLI**: If you plan to work with AWS resources during the presentation, install the AWS Command Line Interface by following this guide: [AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

- **Set AWS AK/SK**: Set the AWS Access Key ID and Secret Access Key environment variables to authenticate with AWS cli
```bash
export AWS_ACCESS_KEY_ID=<your access key id>
export AWS_SECRET_ACCESS_KEY=<your secret key>
```

Let's make sure your environment is set up, run the following commands:
- `aws sts get-caller-identity` (validates your aws authentication)
- `terraform --version` (validates terraform is installed. we will target v1.5.7)


## The What

[Terraform](https://www.terraform.io/) is an Infrastructure as Code (IaC) tool that allows you to define and provision infrastructure resources in a **declarative** manner. With Terraform, you can automate the creation, modification, and management of infrastructure components such as virtual machines, databases, networks, and more. It helps you establish consistent and reproducible infrastructure across various cloud providers and on-premises environments.

## The Why

### Why Terraform?

- **Infrastructure as Code**: Terraform enables you to define infrastructure in code, making it versionable, repeatable, and easily maintainable.

- **Multi-Cloud Support**: It supports multiple cloud providers like AWS, Azure, and GCP; as well as on-premise environments like OpenStack, VMWare vSphere, and proxmox - allowing you to manage resources across different platforms in a unified way.

- **Resource Dependency Management**: Terraform understands the dependencies between resources, ensuring that they are provisioned in the correct order.

- **Change Management**: It provides a plan and preview feature, allowing you to see the changes before applying them, reducing the risk of unexpected disruptions.

- **Community and Ecosystem**: Terraform has a vibrant community and a rich ecosystem of modules and providers, making it easier to get started and extend functionality.

## The How

### Getting Started

1. **Installation**: To get started with Terraform, you'll need to [install Terraform](https://github.com/tfutils/tfenv) using `tfenv`.

2. **Write Terraform Code**: Create `.tf` files to define your infrastructure resources and configurations.

3. **Initialize the Project**: Run `terraform init` to initialize your project and download necessary providers.

4. **Plan and Apply**: Use `terraform plan` to preview changes and `terraform apply` to apply them to your infrastructure.

## The Who

[David Penton](https://twitter.com/dpenton) - renowned software master, mathematician, and all around nerd.\
[Justin Williams](https://twitter.com/JustinsHat) - the other guy talking at you.
