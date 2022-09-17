# Helm Charts

[Helm](https://helm.sh) Charts to support [Project Telescope](https://rh-telescope.github.io).

## Usage

Charts are available in the following formats:

* [Chart Repository](https://helm.sh/docs/topics/chart_repository/)

### Installing from the Chart Repository

The following command can be used to add the chart repository:

```shell
helm repo add telescope https://rh-telescope.github.io/helm-charts
helm repo update
```

Once the chart has been added, install one of the available charts:

```shell
helm upgrade -i <release_name> telescope/<chart_name>
```

## Charts

* [dashboard-react-app](charts/dashboard-react-app)
* [telescope-backend](charts/telescope-backend)
