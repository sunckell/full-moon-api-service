output "launch_configuration" {
  value = "${aws_launch_configuration.web.id}"
}

output "asg_name" {
  value = "${aws_autoscaling_group.web.id}"
}

output "alb_hostname" {
  value = "${aws_alb.main.dns_name}"
}
