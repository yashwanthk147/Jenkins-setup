ec2 = {
    main = {
      instance_name = "Jenkins"
      type = "t2.medium"
      key = "mykey"
    }   
}

sg = {
    main = {
      sg_name = "Jenkins-sg"
    }   
}

tags = {}