#FROM samuelololol/docker-gentoo-crossdev-distccd
FROM samuelololol/docker-gentoo-xdistccd-s3
MAINTAINER samuelololol <samuelololol@gmail.com>
# remove to prevent crossdev build linux-headers fail
RUN rm -rf /sbin/unix_chkpwd
RUN FEATURES="${FEATURES} -ccache" crossdev -S -v -t armv6j-hardfloat-linux-gnueabi -P -uv
RUN rm -r /usr/portage
CMD ["/usr/local/sbin/distccd-launcher", "--allow", "0.0.0.0/0", "--user", "distcc", "--log-level", "notice", "--log-stderr", "--no-detach"]
EXPOSE 3632
