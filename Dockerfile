FROM samuelololol/docker-gentoo-crossdev-distccd
MAINTAINER samuelololol <samuelololol@gmail.com>
RUN CFLAGS="-O2 -pipe" CXXFLAGS="${CFLAGS}" crossdev -S -v -t armv6j-hardfloat-linux-gnueabi
RUN rm -r /usr/portage
CMD ["/usr/local/sbin/distccd-launcher", "--allow", "0.0.0.0/0", "--user", "distcc", "--log-level", "notice", "--log-stderr", "--no-detach"]
EXPOSE 3632
