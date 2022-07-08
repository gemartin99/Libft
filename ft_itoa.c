/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gemartin <gemartin@student.42barc...>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/22 13:51:22 by gemartin          #+#    #+#             */
/*   Updated: 2022/01/25 21:04:08 by marvin           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

long int	static	ft_base(long int base, size_t exp, int *value)
{
	long int	nbr;

	*value = 1;
	if (exp == 0)
		return (1);
	nbr = base;
	while (--exp)
		nbr *= base;
	return (nbr);
}

char	*ft_itoa(int n)
{
	int		value;
	char	*nbr;
	size_t	digit;

	digit = 1;
	while (n / ft_base(10, digit, &value))
		digit++;
	if (n < 0)
	{
		value = -1;
		digit++;
	}
	nbr = (char *)ft_calloc(digit + 1, sizeof(char));
	if (!nbr)
		return (0);
	while (--digit)
	{
		nbr[digit] = (char)(value * (n % 10) + '0');
		n /= 10;
	}
	if (value == 1)
		nbr[digit] = (char)((n % 10) + '0');
	else
		nbr[0] = '-';
	return (nbr);
}
