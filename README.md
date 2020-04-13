# tiendanube-cedeira

The purpose of this project is to complete TiendaNube's DevOps test, called **"THE TEST"**

![TiendaNube Logo](/images/logo.png)

## The test

You need to create a stack using infrastructure as a code with terraform, and this structure needs to be built into AWS provider using t2.micro instances (aws free tier - we aren'tn responsible for AWS fees), or using yourself criterias over your aws account.

### The resources
	
	- 1x Application Load Balancer
	- 2x EC2 Server
		- Server 01 - must have Nginx.
		- Server 02 - must have Apache.
	- 2x security groups
		- To ALB
		- To EC2 instances.

Besides that, all resources involving ALB stack must be created too. Important: All resources need to be created using Terraform.

### Deliverable
	• The terraform script using some repository in github, bitbucket or other.
	• Terraform output needs to expose ALB address.

**_Delivery time 5 days._**

#### How will we evaluate your test?
	• We will replicate your stack into our testing AWS region.
	• We will evaluate quaity of your code as well as best practices and organization.


## HOW TO

`**tiendanube.pem** is provided on this repository.`

### Plan

```
terraform plan \
	-var access_key={your_access_key}\
	-var access_key={your_secret_key}\
        -var aws_region={your_aws_region}
```

### Apply

```
terraform apply \
	-var access_key={your_access_key}\
	-var access_key={your_secret_key}\
        -var aws_region={your_aws_region}
```


Once all is applied please wait for a few minutes and then test by launching a browser with the ALB url (provided in terraform outputs, as shown bellow)
```
Outputs:

instances_ip = [
  "3.217.145.195",
  "107.20.126.71",
]
lb_address = alb-tiendanube-1806563985.us-east-1.elb.amazonaws.com
```

### TEST

Access **lb_address** several times or refresh your browser and it will switch into 2 different pages.

#### Apache 
![TiendaNube Logo](/images/apache-image.png)

#### Nginx
![TiendaNube Logo](/images/nginx-image.png)

Finally, If all it's working as expected, you can destroy the entire stack.

### Destroy

```
terraform destroy
```
