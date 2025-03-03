# DSW-Projekt-Indywidualny
# Nowatorski Projekt Indywidualny

## Opis projektu
Projekt ten realizowany w ramach przedmiotu **Nowatorski Projekt Indywidualny** ma na celu zaprezentowanie umiejętności w zakresie infrastruktury jako kodu (IaC), konteneryzacji aplikacji oraz zarządzania środowiskiem Kubernetes. Projekt spełnia szereg wymagań technicznych, które obejmują użycie Terraform, Docker, Kubernetes oraz najlepszych praktyk w zakresie zarządzania aplikacjami w chmurze.

### Technologie użyte w projekcie:
- **Terraform** do zarządzania infrastrukturą
- **Docker** do tworzenia obrazów kontenerów
- **Kubernetes** do orkiestracji kontenerów
- **CI/CD** (Continuous Integration/Continuous Delivery) do automatyzacji procesu wdrażania
- **Secret** do przechowywania zmiennych środowiskowych
- **ConfigMap** do przechowywania konfiguracji aplikacji
- **Persistent Volume** do przechowywania danych aplikacji w sposób trwały

---

## Wymagania

### Ocena 3.0:
- **Infrastruktura opisana w Terraformie** – cała infrastruktura w projekcie jest zdefiniowana za pomocą Terraform, co umożliwia jej łatwą replikację oraz zarządzanie.
- **Aplikacja uruchamia się za pomocą `terraform apply`** – po wykonaniu komendy `terraform apply`, aplikacja jest gotowa do uruchomienia na środowisku.
- **Minimalnie jeden obraz Docker zbudowany samemu** – stworzono własny obraz Docker, który jest wykorzystywany w projekcie.
- **Deployment w Kubernetes** – aplikacja jest wdrożona w Kubernetes za pomocą obiektu typu `Deployment`.
- **API lub aplikacja webowa z Ingress** – jedna z aplikacji wystawia API lub aplikację webową poprzez Ingress w Kubernetes.
- **Określenie zasobów dla kontenerów** – każdy kontener posiada zdefiniowane zasoby (CPU, pamięć) w Kubernetes.

### Ocena 3.5:
- **Obraz Docker typu multi-stage** – obraz Docker został zbudowany w sposób multi-stage, z osobnym etapem budowania i uruchamiania aplikacji.
- **CronJob lub Job w Kubernetes** – na środowisku Kubernetes zostały wdrożone zadania typu CronJob lub Job, które wykonują określone czynności okresowe lub jednorazowe.
- **Zmienna środowiskowa pobierana z Secret** – aplikacja pobiera zmienne środowiskowe z Kubernetes Secret, zapewniając bezpieczeństwo przechowywanych danych.

### Ocena 4.0:
- **Konstrukt `for_each`/`count` w Terraformie** – w pliku Terraform zostały zastosowane konstrukty `for_each` i `count`, zarówno w kontekście zasobów, jak i w wewnątrz zasobów dynamicznych.
- **Wdrożenie StatefulSet oraz Deployment w Kubernetes** – aplikacja składa się z dwóch typów wdrożeń: StatefulSet (dla aplikacji wymagających trwałego przechowywania danych) oraz Deployment (dla aplikacji skalowalnych).
- **Persistent Volume i Persistent Volume Claim** – aplikacja typu StatefulSet używa PersistentVolume i PersistentVolumeClaim do trwałego przechowywania danych.
- **Aplikacje w różnych namespace** – aplikacje zostały wdrożone w różnych namespace w Kubernetes, co umożliwia ich separację i lepszą organizację.
- **Komunikacja między aplikacjami** – aplikacje komunikują się ze sobą wewnętrznie w ramach klastra Kubernetes.
- **Konfiguracja aplikacji z ConfigMap** – konfiguracja aplikacji jest przechowywana w ConfigMap i wykorzystywana przez aplikacje w trakcie ich uruchamiania.

### Ocena końcowa: 4.5