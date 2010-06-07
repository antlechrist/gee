# gee - site generation tool
# See LICENSE file for copyright and license details.

include config.mk

install:
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f gee ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/gee
	@mkdir -p ${DESTDIR}${MANPREFIX}/man1
	@sed "s/VERSION/${VERSION}/g" < gee.1 > ${DESTDIR}${MANPREFIX}/man1/gee.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/gee.1

uninstall:
	@rm -f ${DESTDIR}${PREFIX}/bin/gee
	@rm -f ${DESTDIR}${MANPREFIX}/man1/gee.1
