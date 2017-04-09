FROM samuelololol/docker-gentoo-crossdev-distccd
MAINTAINER samuelololol <samuelololol@gmail.com>
# remove to prevent crossdev build linux-headers fail
RUN rm /sbin/unix_chkpwd
RUN crossdev -S -v -t armv6j-hardfloat-linux-gnueabi
RUN rm -r /usr/portage
CMD ["/usr/local/sbin/distccd-launcher", "--allow", "0.0.0.0/0", "--user", "distcc", "--log-level", "notice", "--log-stderr", "--no-detach"]
EXPOSE 3632
