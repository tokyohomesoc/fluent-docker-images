.SILENT :
.PHONY : fluent-mackerel fluent-split fluent-twitter


fluent-mackerel:
	docker build -t tokyohomesoc/fluent-mackerel:test fluent-mackerel
	docker images
    docker history tokyohomesoc/fluent-mackerel:test


fluent-split:
	docker build -t tokyohomesoc/fluent-split:test fluent-split
	docker images
    docker history tokyohomesoc/fluent-split:test


fluent-twitter:
	docker build -t tokyohomesoc/fluent-twitter:test fluent-twitter
	docker images
    docker history tokyohomesoc/fluent-twitter:test