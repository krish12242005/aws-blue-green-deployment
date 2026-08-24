\# 🔵🟢 AWS Blue-Green Deployment



A production-style Blue-Green Deployment architecture designed using

AWS Application Load Balancer, EC2, Auto Scaling, IAM, Amazon S3,

AWS CodeDeploy and Terraform.



\## 🚀 Project Overview



This project demonstrates how Blue-Green Deployment can reduce

application downtime and deployment risk.



Two application environments are maintained:



\- 🔵 Blue - Current production version

\- 🟢 Green - New application version



Traffic can be shifted from Blue to Green after successful deployment

and validation.



\## 🏗️ Architecture



```text

&#x20;                   Internet

&#x20;                      |

&#x20;                      v

&#x20;             Application Load Balancer

&#x20;                      |

&#x20;             +--------+--------+

&#x20;             |                 |

&#x20;             v                 v

&#x20;       🔵 BLUE ENV        🟢 GREEN ENV

&#x20;       Version 1.0        Version 2.0

&#x20;             |                 |

&#x20;             +--------+--------+

&#x20;                      |

&#x20;                 AWS CodeDeploy

&#x20;                      |

&#x20;                   Amazon S3

